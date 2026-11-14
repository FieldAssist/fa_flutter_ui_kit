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

  /// Stops the location-off watcher and the position stream, e.g. when the
  /// working day ends. The last fix is kept; the next [initLocation] starts
  /// both again.
  Future<void> stopLocationUpdates();
}

class LocationInfoImpl implements LocationInfo {
  final GlobalKey<NavigatorState>? navKey;

  final bool enforceGeocoding;

  LocationInfoImpl({required this.navKey, this.enforceGeocoding = true});

  final String defaultLocationReason =
      'Your current location helps your manager in reviewing work done by you';

  final _deviceLocation = ValueNotifier<LocationData?>(null);

  Timer? locationCheckTimer;

  StreamSubscription<Position>? locationStreamSubs;

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
    if (isMobile) {
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

      // Asked only when missing. On Android 10+ a request made while access
      // is already "while in use" also asks for background access; the app
      // asks for that on its own terms.
      var permission = await Geolocator.checkPermission();
      if (!_isPermissionGranted(permission)) {
        permission = await Geolocator.requestPermission();
      }

      final geolocationStatus = await isLocationEnabled();
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
        await fetchLocation();
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

  /// A GPS fix, or null when none arrives within [_fixTimeLimit]. The limit
  /// is geolocator's own, so the native request is cancelled, not left
  /// running behind a retry.
  static Future<Position?> _getLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: _fixTimeLimit,
        ),
      );
    } on TimeoutException {
      return null;
    }
  }

  static const _fixTimeLimit = Duration(seconds: 10);

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
      if (position != null) {
        final locationData = await _parseLocation(position);
        _setLocation(locationData);
      }
    });
  }

  void stopLocationFetchStream() {
    locationStreamSubs?.cancel();
  }

  @override
  Future<void> stopLocationUpdates() async {
    locationCheckTimer?.cancel();
    final subscription = locationStreamSubs;
    // Cleared, so the `??=` in [_startLocationFetchStream] starts afresh.
    locationStreamSubs = null;
    positionStream = null;
    await subscription?.cancel();
  }

  void _setLocation(LocationData location) {
    if (location != null) {
      _deviceLocation.value = location;
      //prefsHelper.lastLocation = jsonEncode(_deviceLocation.value.toJson());
    } else {
      throw LocationException(
        '${Constants.locationNotAvailable}',
      );
    }
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

  /// Gets a first fix: GPS, then a fallback position. With neither, throws
  /// [LocationTimeoutException] — but only while the app is in front. A
  /// while-in-use app gets no fix in the background, and a system dialog over
  /// the app (Android's location-accuracy prompt) holds the request; neither
  /// means the location is unavailable, so the fetch waits for the app to come
  /// back and tries again.
  @visibleForTesting
  Future<void> fetchLocation() async {
    while (true) {
      if (await _startFetchingLocation()) {
        return;
      }
      final fallback = await _fallbackPosition();
      if (fallback != null) {
        await _onLocationFetch(fallback);
        return;
      }
      if (_isInForeground) {
        throw const LocationTimeoutException();
      }
      await _untilResumed();
    }
  }

  /// No lifecycle state yet counts as in front, so a fetch never waits on a
  /// resume that cannot come.
  static bool get _isInForeground {
    final state = WidgetsBinding.instance.lifecycleState;
    return state == null || state == AppLifecycleState.resumed;
  }

  static Future<void> _untilResumed() {
    final resumed = Completer<void>();
    final listener = AppLifecycleListener(onResume: resumed.complete);
    // It may have come back between the check and the listener.
    if (_isInForeground && !resumed.isCompleted) {
      resumed.complete();
    }
    return resumed.future.whenComplete(listener.dispose);
  }

  /// A position when GPS gave none in time: the OS's last known one, then on
  /// Android the fused provider through the app's native channel, which can
  /// return a fix another app took and never shows the settings dialog.
  Future<Position?> _fallbackPosition() async {
    final lastKnown = await Geolocator.getLastKnownPosition()
        .timeout(const Duration(seconds: 5), onTimeout: () => null);
    if (lastKnown != null || defaultTargetPlatform != TargetPlatform.android) {
      return lastKnown;
    }
    try {
      final native = await getInstantLocationFromNative()
          .timeout(const Duration(seconds: 5));
      final latitude = native?.latitude;
      final longitude = native?.longitude;
      if (latitude == null || longitude == null) {
        return null;
      }
      return Position(
        latitude: latitude,
        longitude: longitude,
        timestamp: DateTime.now(),
        accuracy: native?.accuracy?.toDouble() ?? 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    } catch (e, s) {
      // Includes apps that don't implement the channel.
      logger.e(e, s);
      return null;
    }
  }

  Future<void> _onLocationFetch(Position location) async {
    final locationData = await _parseLocation(location);
    _setLocation(locationData);
    _startLocationServiceCheckTimer();
    if (isMobile) {
      _startLocationFetchStream();
    } else {
      logger.i('Location: Not stating location stream');
    }
  }

  /// Whether a GPS fix arrived in time; when it did, it is now the location.
  Future<bool> _startFetchingLocation() async {
    final location = await _getLocation();
    if (location == null) {
      return false;
    }
    await _onLocationFetch(location);
    return true;
  }

  void _startLocationServiceCheckTimer() {
    final isTimerActive = locationCheckTimer?.isActive ?? false;
    if (!isTimerActive) {
      locationCheckTimer =
          Timer.periodic(const Duration(seconds: 1), (t) async {
        final _checkPermission = await isLocationPermissionGranted();
        final geolocationStatus = await isLocationEnabled();
        if (!_checkPermission || !geolocationStatus) {
          t.cancel();
          if (navKey != null) {
            await navKey!.currentState?.push(
              MaterialPageRoute(
                builder: (_) => AppErrorPage(
                  LocationException(
                    '${Constants.locationNotAvailable}'
                    '',
                  ),
                  onRetryTap: () async {
                    // Fetch first and leave only with a fix: closing first
                    // dropped the user back with no location and no message
                    // when the fetch failed. A fix restarts this watcher.
                    try {
                      await initLocation();
                    } catch (e, s) {
                      logger.e(e, s);
                      return;
                    }
                    navKey!.currentState?.pop();
                  },
                ),
              ),
            );
          }
        }
      });
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
    if (isMobile && positionStream != null) {
      return positionStream!.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) async {
            if (data != null) {
              /// Adding the current location because
              /// it is already fetched and parsed from [positionStream] listener
              if (_deviceLocation.value != null) {
                sink.add(currentLocation);
              }
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
  Future<bool> isLocationEnabled() => isLocationServiceOn();

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

/// Whether device location is on.
///
/// On Android, geolocator reports a failed location-settings check as a
/// `LOCATION_SERVICES_DISABLED` [PlatformException] instead of returning
/// `false`. Its other APIs map that code to [LocationServiceDisabledException],
/// so it is read as off here too.
Future<bool> isLocationServiceOn() async {
  try {
    return await Geolocator.isLocationServiceEnabled();
  } on PlatformException catch (e) {
    if (e.code == 'LOCATION_SERVICES_DISABLED') {
      return false;
    }
    rethrow;
  }
}

extension PositionX on Position {
  LatLng get latLng => LatLng(latitude, longitude);
}
