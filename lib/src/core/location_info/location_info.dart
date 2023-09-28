import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/models/place_mark_data/place_mark_data.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class LocationInfo {
  LocationData get currentLocation;

  Stream<LocationData> get locationStream;

  Future<void> initLocation();

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
}

class LocationInfoImpl implements LocationInfo {
  final GlobalKey<NavigatorState> navKey;

  LocationInfoImpl({required this.navKey});

  final String defaultLocationReason =
      'Your current location helps your manager in reviewing work done by you';

  final _deviceLocation = ValueNotifier<LocationData?>(null);

  Timer? locationCheckTimer;

  StreamSubscription<Position>? locationStreamSubs;

  @override
  LocationData get currentLocation => _deviceLocation.value!;

  Stream<Position>? positionStream;

  @override
  Future initLocation() async {
    if (isMobile) {
      final permissionStatus = await Geolocator.checkPermission();

      if (!_isPermissionGranted(permissionStatus)) {
        await DialogUtils.showAlertDialog(
            title: 'Location Permission Required!',
            content: defaultLocationReason,
            actionText: 'OKAY GOT IT',
            navKey: navKey);
      }

      final permission = await Geolocator.requestPermission();
      final geolocationStatus = await Geolocator.isLocationServiceEnabled();

      if (_isPermissionGranted(permission) && geolocationStatus) {
        await _fetchLocation();
      } else if (!geolocationStatus) {
        throw LocationException(
          'Location setting on your device is off.'
          ' Please enable to proceed!\n$defaultLocationReason',
        );
      } else if (!_isPermissionGranted(permission)) {
        throw LocationException(
          'Please enable Location Permission to the App!'
          '\n$defaultLocationReason',
        );
      } else {
        throw LocationException(
          '${Constants.locationNotAvailable}\n$defaultLocationReason',
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
    ).asBroadcastStream().shareValue();
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

  void _setLocation(LocationData location) {
    if (location != null) {
      _deviceLocation.value = location;
      //prefsHelper.lastLocation = jsonEncode(_deviceLocation.value.toJson());
    } else {
      throw LocationException(
        '${Constants.locationNotAvailable}\n$defaultLocationReason',
      );
    }
  }

  Future<LocationData> _parseLocation(Position location) async {
    final placemark = await getPlacemarkDataFromCoordinates(location);
    final locationData = LocationData(
      latitude: location.latitude,
      longitude: location.longitude,
      accuracy: location.accuracy.toInt(),
      captureTime: location.timestamp!.millisecondsSinceEpoch ~/ 1000,
      captureLocationTime: DateTimeUtils.getCurrentISOTimeString(
          dateTime: location.timestamp!.toLocal()),
      source: isAndroid ? 'Android' : (isIOS ? 'iOS' : 'Unknown'),
      capturedAddress: placemark.getFullAddress(),
      placeMarkData: placemark,
    );
    return locationData;
  }

  Future _fetchLocation() async {
    await _startFetchingLocation().timeout(const Duration(seconds: 10),
        onTimeout: () async {
      final position = await Geolocator.getLastKnownPosition();
      if (position == null) {
        throw LocationException(
          '${Constants.locationNotAvailable}\n$defaultLocationReason',
        );
      } else {
        await _onLocationFetch(position);
      }
    });
  }

  Future _onLocationFetch(Position location) async {
    final locationData = await _parseLocation(location);
    _setLocation(locationData);
    _startLocationServiceCheckTimer();
    if (isMobile) {
      _startLocationFetchStream();
    } else {
      logger.i('Location: Not stating location stream');
    }
  }

  Future _startFetchingLocation() async {
    Position location;
    location = await _getLocation();
    if (location == null) {
      throw LocationException(
        '${Constants.locationNotAvailable}\n$defaultLocationReason',
      );
    }
    await _onLocationFetch(location);
  }

  void _startLocationServiceCheckTimer() {
    if (locationCheckTimer == null || !locationCheckTimer!.isActive) {
      locationCheckTimer =
          Timer.periodic(const Duration(seconds: 4), (t) async {
        final permission = await Geolocator.checkPermission();
        final geolocationStatus = await Geolocator.isLocationServiceEnabled();
        if (!_isPermissionGranted(permission) || !geolocationStatus) {
          t.cancel();

          await navKey.currentState!.push(MaterialPageRoute(
            builder: (_) => AppErrorPage(
              LocationException(
                '${Constants.locationNotAvailable}'
                '\n$defaultLocationReason',
              ),
              onRetryTap: () {
                initLocation();
              },
            ),
          ));
        }
      });
    }
  }

  @override
  Future<String> getAddress(Position location) async {
    String _address = "";
    try {
      final placemark = await getPlacemarkDataFromCoordinates(location);

      _address = placemark.getFullAddress();
    } catch (e, s) {
      logger.e(e, s);
    }
    return checkIfNotEmpty(_address) ? _address : 'NA';
  }

  Future<PlaceMarkData> getPlacemarkDataFromCoordinates(
      Position location) async {
    final placemark = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );
    return PlaceMarkData.fromPlacemark(placemark[0]);
  }

  @override
  Stream<LocationData> get locationStream {
    if (isMobile && positionStream != null) {
      return positionStream!.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) async {
            if (data != null) {
              final locationData = await _parseLocation(data);
              _setLocation(locationData);
              return sink.add(locationData);
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
}

extension PositionX on Position {
  LatLng get latLng => LatLng(latitude, longitude);
}
