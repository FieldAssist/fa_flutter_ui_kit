import 'dart:async';
import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/models/place_mark_data/place_mark_data.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class LocationInfo {
  LocationData get currentLocation;

  Stream<LocationData> get locationStream;

  Future<void> initLocation();

  Future<LocationData> getLocationWithPlacemarkData();

  @protected
  Future<String> getAddress(Position location);

  /// Check if [inputLocation] and [currentLocation]
  /// is within the [minDistance] in metres
  ///
  /// returns false if not else true.
  ///
  /// Default [minDistance] is 300 meters
  bool isLocationWithinRange(
    LatLng inputLocation, {
    double minDistance = 300,
  });

  Future<bool> isLocationEnabled();

  Future<bool> isLocationPermissionGranted();

  Future<LocationData?> getInstantLocationFromNative();
}

class LocationInfoImpl implements LocationInfo {
  final GlobalKey<NavigatorState>? navKey;

  final bool enforceGeocoding;

  LocationInfoImpl({required this.navKey, this.enforceGeocoding = true});

  /// Overrides the [isMobile] platform check so tests can exercise the
  /// mobile-only code paths (the service-check timer and position stream) on
  /// the test VM, where `Platform.isAndroid`/`Platform.isIOS` are always
  /// false. Has no effect outside of tests.
  @visibleForTesting
  bool debugForceMobile = false;

  bool get _treatAsMobile => isMobile || debugForceMobile;

  final String defaultLocationReason =
      'Your current location helps your manager in reviewing work done by you';

  final _deviceLocation = ValueNotifier<LocationData?>(null);

  Timer? locationCheckTimer;

  StreamSubscription<Position>? locationStreamSubs;

  /// Number of consecutive failed checks required before
  /// [_startLocationServiceCheckTimer] surfaces the error page. Some OEM
  /// devices (e.g. Samsung tablets with aggressive background throttling)
  /// intermittently fail the underlying Play Services location settings
  /// check even when location is genuinely enabled, so a single failure is
  /// not treated as conclusive.
  static const _kConsecutiveLocationFailureThreshold = 2;

  /// Backoff delays used by [_scheduleStreamReconnect] to resubscribe to the
  /// position stream after it errors out, before giving up and leaving
  /// recovery to the location-service check timer / manual retry.
  static const _kStreamReconnectDelays = [
    Duration(seconds: 2),
    Duration(seconds: 5),
    Duration(seconds: 10),
  ];

  int _consecutiveLocationCheckFailures = 0;

  bool _isCheckingLocationStatus = false;

  int _streamReconnectAttempts = 0;

  Timer? _streamReconnectTimer;

  static const _locationChannel =
      MethodChannel('com.fieldassist.location_channel');

  @override
  LocationData get currentLocation {
    final loc = _deviceLocation.value;
    if (loc == null) {
      throw LocationException(
        '${Constants.locationNotAvailable}',
      );
    }
    return loc;
  }

  Stream<Position>? positionStream;

  @override
  Future initLocation() async {
    if (_treatAsMobile) {
      /// For iOS, location will be asked at day start time so not showing this
      /// on Splash page.
      /// This is done because iOS app gets rejected if we ask for location
      /// on splash and if it is disabled, user is asked to turn on the location
      /// to use the app
      if (!Platform.isIOS) {
        final permissionStatus = await isLocationPermissionGranted();

        if (!permissionStatus) {
          if (navKey != null) {
            await DialogUtils.showAlertDialog(
                title: 'Location Permission Required!',
                content: defaultLocationReason,
                actionText: 'Continue',
                navKey: navKey!);
          }
        }
      }

      final permission = await Geolocator.requestPermission();

      final geolocationStatus = await Geolocator.isLocationServiceEnabled();
      if (!geolocationStatus) {
        throw LocationException('Oops! Location is turned off');
      }
      if (!_isPermissionGranted(permission)) {
        throw LocationException('Please Allow Location Permission');
      }

      final accuracy = await Geolocator.getLocationAccuracy();
      if (accuracy == LocationAccuracyStatus.reduced) {
        throw LocationException(
          'Please Enable Precise Location',
        );
      }

      if (_isPermissionGranted(permission) && geolocationStatus) {
        await _fetchLocation();
      } else {
        throw LocationException(
          '${Constants.locationNotAvailable}',
        );
      }
    } else {
      final location = LocationData(
        latitude: 26.85,
        longitude: 80.94,
        capturedAddress: 'Lucknow 22606',
        captureTime: 1572035661,
        accuracy: 1,
      );
      _setLocation(location);
    }
  }

  static Future<Position> _getLocation() async {
    final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return location;
  }

  bool _isPermissionGranted(LocationPermission permission) {
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  LocationSettings getLocationSetting() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,

        /// TODO(@vatsal201): check intervalDuration whether
        /// this is working properly or not.
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 10,
      );
    } else {
      return LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );
    }
  }

  void _startLocationFetchStream() {
    _streamReconnectTimer?.cancel();
    _streamReconnectAttempts = 0;
    positionStream ??= Geolocator.getPositionStream(
      locationSettings: getLocationSetting(),
    ).bufferTime(const Duration(seconds: 2)).transform<Position>(
      StreamTransformer.fromHandlers(handleData: (d, sink) {
        if (d.isNotEmpty) {
          sink.add(d.last);
        }
      }),
    ).shareValue();
    locationStreamSubs ??= positionStream?.listen((position) async {
      _streamReconnectAttempts = 0;
      final locationData = await _parseLocation(position);
      _setLocation(locationData);
    }, onError: (Object e, StackTrace s) {
      /// The platform position stream can error out (e.g. location services
      /// disabled mid-session). Reset the memoized stream/subscription so a
      /// subsequent resubscribe actually attaches a fresh stream instead of
      /// being a no-op due to the `??=` guards above, and schedule a backoff
      /// retry so a transient failure self-heals without requiring the user
      /// to manually retry.
      logger.e(e, s);
      positionStream = null;
      locationStreamSubs = null;
      _scheduleStreamReconnect();
    });
  }

  void _scheduleStreamReconnect() {
    _streamReconnectTimer?.cancel();
    if (_streamReconnectAttempts >= _kStreamReconnectDelays.length) {
      logger.e(
        'Location: exhausted position stream reconnect attempts; '
        'leaving recovery to the location service check timer or a manual retry.',
        StackTrace.current,
      );
      return;
    }
    final delay = _kStreamReconnectDelays[_streamReconnectAttempts];
    _streamReconnectAttempts++;
    _streamReconnectTimer = Timer(delay, _startLocationFetchStream);
  }

  void stopLocationFetchStream() {
    locationStreamSubs?.cancel();
  }

  /// Cancels the location-service check timer and the position stream
  /// subscription. Safe to call multiple times.
  ///
  /// Deliberately not part of the [LocationInfo] interface: this class is
  /// registered as an app-lifetime singleton with no current caller, and
  /// [LocationInfo] is implemented (not extended) elsewhere, so adding an
  /// interface method here would force every implementer to add it too.
  void dispose() {
    locationCheckTimer?.cancel();
    locationCheckTimer = null;
    locationStreamSubs?.cancel();
    locationStreamSubs = null;
    positionStream = null;
    _streamReconnectTimer?.cancel();
    _streamReconnectTimer = null;
  }

  void _setLocation(LocationData location) {
    _deviceLocation.value = location;
    //prefsHelper.lastLocation = jsonEncode(_deviceLocation.value.toJson());
  }

  Future<LocationData> _parseLocation(Position location) async {
    PlaceMarkData? placemark;
    try {
      if (enforceGeocoding) {
        placemark = await getPlacemarkDataFromCoordinates(
                latitude: location.latitude, longitude: location.longitude)
            .timeout(Duration(seconds: 5), onTimeout: () {
          return PlaceMarkData(name: "Test Street");
        });
      }
    } finally {
      final locationData = LocationData(
        latitude: location.latitude,
        longitude: location.longitude,
        accuracy: location.accuracy.toInt(),
        captureTime: location.timestamp.millisecondsSinceEpoch ~/ 1000,
        captureLocationTime: DateTimeUtils.getCurrentISOTimeString(
            dateTime: location.timestamp.toLocal()),
        source: isAndroid ? 'Android' : (isIOS ? 'iOS' : 'Unknown'),
        capturedAddress: placemark?.getFullAddress() ?? null,
        placeMarkData: placemark,
      );
      return locationData;
    }
  }

  Future _fetchLocation() async {
    await _startFetchingLocation().timeout(const Duration(seconds: 10),
        onTimeout: () async {
      final position = await Geolocator.getLastKnownPosition()
          .timeout(Duration(seconds: 5), onTimeout: () {
        return null;
      });
      if (position == null) {
        throw LocationException(
          '${Constants.locationNotAvailable}',
        );
      } else {
        await _onLocationFetch(position);
      }
    });
  }

  Future<void> _onLocationFetch(Position location) async {
    final locationData = await _parseLocation(location);
    _setLocation(locationData);
    _startLocationServiceCheckTimer();
    if (_treatAsMobile) {
      _startLocationFetchStream();
    } else {
      logger.i('Location: Not stating location stream');
    }
  }

  Future<void> _startFetchingLocation() async {
    final location = await _getLocation();
    await _onLocationFetch(location);
  }

  void _startLocationServiceCheckTimer() {
    final isTimerActive = locationCheckTimer?.isActive ?? false;
    if (!isTimerActive) {
      _consecutiveLocationCheckFailures = 0;
      locationCheckTimer =
          Timer.periodic(const Duration(seconds: 1), (t) async {
        if (_isCheckingLocationStatus) {
          /// The previous tick's check is still awaiting the platform call
          /// (can happen when the underlying call is slow/flaky). Skip this
          /// tick rather than let overlapping checks race on
          /// [_consecutiveLocationCheckFailures].
          return;
        }
        _isCheckingLocationStatus = true;
        final bool isLocationOk;
        try {
          isLocationOk = await _checkLocationStatus();
        } finally {
          _isCheckingLocationStatus = false;
        }

        if (isLocationOk) {
          _consecutiveLocationCheckFailures = 0;
          return;
        }

        _consecutiveLocationCheckFailures++;
        if (_consecutiveLocationCheckFailures <
            _kConsecutiveLocationFailureThreshold) {
          /// Ignore isolated failures: on some devices the underlying
          /// platform call is flaky and fails transiently even though
          /// location is genuinely enabled. Require consecutive failures
          /// before surfacing an error to the user.
          return;
        }

        t.cancel();
        if (navKey == null) {
          logger.e(
            'Location: service check failed and no navKey is available to '
            'surface the error page; location monitoring has stopped silently.',
            StackTrace.current,
          );
          return;
        }
        await navKey!.currentState?.push(
          MaterialPageRoute(
            builder: (_) => AppErrorPage(
              LocationException(
                '${Constants.locationNotAvailable}'
                '',
              ),
              onRetryTap: () async {
                try {
                  if (await _checkLocationStatus()) {
                    navKey!.currentState?.pop();
                    _startLocationServiceCheckTimer();
                    await initLocation();
                  }
                } catch (e, s) {
                  logger.e(e, s);
                }
              },
            ),
          ),
        );
      });
    }
  }

  /// Returns whether location permission is granted and location services
  /// are enabled. Any exception from the underlying platform call (e.g. a
  /// Play Services hiccup on certain OEM devices) is treated as a failed
  /// check rather than being left to crash uncaught.
  Future<bool> _checkLocationStatus() async {
    try {
      final checkPermission = await isLocationPermissionGranted();
      if (!checkPermission) {
        logger.e('Location: permission not granted', StackTrace.current);
        return false;
      }
      final geolocationStatus = await isLocationEnabled();
      if (!geolocationStatus) {
        logger.e('Location: service reported disabled', StackTrace.current);
        return false;
      }
      return true;
    } catch (e, s) {
      logger.e(e, s);
      return false;
    }
  }

  @override
  Future<String> getAddress(Position location) async {
    String _address = "";
    try {
      final placemark = await getPlacemarkDataFromCoordinates(
          latitude: location.latitude, longitude: location.longitude);

      _address = placemark.getFullAddress();
    } catch (e, s) {
      logger.e(e, s);
    }
    return checkIfNotEmpty(_address) ? _address : 'NA';
  }

  Future<PlaceMarkData> getPlacemarkDataFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final placemark = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      return PlaceMarkData.fromPlacemark(placemark[0]);
    } catch (e, s) {
      logger.e(e, s);

      /// TODO(@singhtaranjeet): Do not throw only LocationException on every exception
      /// Use different exception for different cases
      throw LocationException(
        '${Constants.locationNotAvailable}',
      );
    }
  }

  @override
  Stream<LocationData> get locationStream {
    if (_treatAsMobile && positionStream != null) {
      return positionStream!.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) async {
            /// Adding the current location because it is already fetched
            /// and parsed from [positionStream] listener
            if (_deviceLocation.value != null) {
              sink.add(currentLocation);
            }
          },
        ),
      );
    } else {
      return BehaviorSubject<LocationData>.seeded(currentLocation);
    }
  }

  @override
  bool isLocationWithinRange(LatLng inputLocation, {double minDistance = 300}) {
    final distanceInMeter = Geolocator.distanceBetween(
      currentLocation.latitude!,
      currentLocation.longitude!,
      inputLocation.latitude,
      inputLocation.longitude,
    );
    logger.d("Distance between User and Outlet: ${distanceInMeter.round()} m");
    return distanceInMeter <= minDistance;
  }

  @override
  Future<LocationData> getLocationWithPlacemarkData() async {
    final placemarkData = await getPlacemarkDataforNoGeocoding(
        latitude: currentLocation.latitude ?? 26.85,
        longitude: currentLocation.longitude ?? 80.94);

    return currentLocation.copyWith(
        capturedAddress: placemarkData?.getFullAddress() ?? null,
        placeMarkData: placemarkData);
  }

  Future<PlaceMarkData?> getPlacemarkDataforNoGeocoding({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final placemark = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      return PlaceMarkData.fromPlacemark(placemark[0]);
    } catch (e, s) {
      logger.e(e, s);
      return null;
    }
  }

  @override
  Future<bool> isLocationEnabled() async =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<bool> isLocationPermissionGranted() async {
    final permission = await Geolocator.checkPermission();
    return _isPermissionGranted(permission);
  }

  /// Implement getInstantLocationFromNative method in MainActivity.kt in the
  /// source project.
  @override
  Future<LocationData?> getInstantLocationFromNative() async {
    /// TODO : Will update for iOS as well.
    if (Platform.isIOS) {
      throw UnsupportedError(
          'getInstantLocationFromNative is only supported on Android');
    }
    if ((await isLocationEnabled()) && (await isLocationPermissionGranted())) {
      final result = await _locationChannel
          .invokeMethod<Map>('getInstantLocationFromNative');
      if (result == null) {
        throw LocationException('${Constants.locationNotAvailable}');
      }
      return LocationData(
        latitude: (result['latitude'] as num).toDouble(),
        longitude: (result['longitude'] as num).toDouble(),
        accuracy: (result['accuracy'] as num).toInt(),
        captureTime: DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000,
      );
    }
    return null;
  }
}

extension PositionX on Position {
  LatLng get latLng => LatLng(latitude, longitude);
}
