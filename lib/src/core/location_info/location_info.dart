import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart' hide Location;
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/models/place_mark_data/place_mark_data.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' hide LocationAccuracy;

abstract class LocationInfo {
  LocationModel get currentLocation;

  Stream<LocationModel> get locationStream;

  Future<void> initLocation();

  Future<LocationModel> getLocationWithPlacemarkData();

  Future<void> forceUpdateCurrentLocation();

  @protected
  Future<String> getAddress({
    required double lat,
    required double lng,
  });

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
  final GlobalKey<NavigatorState>? navKey;

  final bool enforceGeocoding;

  LocationInfoImpl({required this.navKey, this.enforceGeocoding = true});

  final String defaultLocationReason =
      'Your current location helps your manager in reviewing work done by you';

  final _deviceLocation = ValueNotifier<LocationModel?>(null);

  Timer? locationCheckTimer;

  StreamSubscription<Position>? locationStreamSubs;

  @override
  LocationModel get currentLocation => _deviceLocation.value!;

  final _location2 = Location();

  // Stream<Position>? positionStream;
  @override
  Future<void> forceUpdateCurrentLocation() async {
    if (isWeb) {
      return;
    }
    final location = await _getLocation(forceGPSUpdate: true);
    if (location == null) {
      throw MyException(
        '${Constants.locationNotAvailable} \n $defaultLocationReason',
      );
    }
    final locationModel = await _parseLocation(location);
    _setLocation(locationModel);
  }

  @override
  Future initLocation() async {
    if (isMobile) {
      final permissionStatus = await Geolocator.checkPermission();

      if (!_isPermissionGranted(permissionStatus)) {
        if (navKey != null) {
          await DialogUtils.showAlertDialog(
              title: 'Location Permission Required!',
              content: defaultLocationReason,
              actionText: 'Continue',
              navKey: navKey!);
        }
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
      final location = LocationModel(
        latitude: 26.85,
        longitude: 80.94,
        capturedAddress: 'Lucknow 22606',
        captureTime: 1572035661,
        accuracy: 1,
      );
      _setLocation(location);
    }
  }

  Future<Position?> _getLocation({bool forceGPSUpdate = false}) async {
    try {
      if (isIOS) {
        final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: isAndroid && forceGPSUpdate,
          timeLimit: Duration(seconds: 10),
        );
        return location;
      } else {
        final location = await _location2.getLocation();

        if (location.latitude == null || location.longitude == null) {
          return null;
        }
        return Position(
          longitude: location.longitude!,
          latitude: location.latitude!,
          timestamp: DateTime.now(),
          accuracy: location.accuracy ?? 9999,
          altitude: location.altitude ?? 9999,
          heading: location.heading ?? 9999,
          speed: location.speed ?? 9999,
          speedAccuracy: location.speedAccuracy ?? 9999,
          altitudeAccuracy: location.accuracy ?? 9999,
          headingAccuracy: location.headingAccuracy ?? 9999,
        );
      }
    } catch (e, s) {
      // ToastUtils.showException(e);
      logger.e(e, s);

      if (isWeb) {
        return null;
      }

      final _currLocFromGeoCoder =
          await Geolocator.getCurrentPosition().timeout(
        Duration(seconds: 10),
        onTimeout: () async {
          final _location = await Geolocator.getLastKnownPosition().timeout(
            Duration(seconds: 5),
            onTimeout: () {
              logger.w(
                  "unable to get last known position using previous captured location");
              // ToastUtils.showException("_get Location Exception Time out");
              final _currentLocation = currentLocation;
              return Position(
                longitude: _currentLocation.longitude,
                latitude: _currentLocation.latitude,
                timestamp: DateTime.now(),
                accuracy: _currentLocation.accuracy?.toDouble() ?? 9999,
                altitude: 0,
                heading: 0,
                speed: 0,
                speedAccuracy: 0,
                altitudeAccuracy: 0,
                headingAccuracy: 0,
              );
            },
          );
          if (_location == null) {
            throw LocationException("Unable to capture location");
          }

          return Position(
            longitude: _location.longitude,
            latitude: _location.latitude,
            timestamp: DateTime.now(),
            accuracy: _location.accuracy,
            altitude: _location.altitude,
            heading: _location.heading,
            speed: _location.speed,
            speedAccuracy: _location.speedAccuracy,
            altitudeAccuracy: _location.altitudeAccuracy,
            headingAccuracy: _location.headingAccuracy,
          );
        },
      );

      return Position(
        longitude: _currLocFromGeoCoder.longitude,
        latitude: _currLocFromGeoCoder.latitude,
        timestamp: DateTime.now(),
        accuracy: _currLocFromGeoCoder.accuracy.toDouble(),
        altitude: _currLocFromGeoCoder.altitude,
        heading: _currLocFromGeoCoder.heading,
        speed: _currLocFromGeoCoder.speed,
        speedAccuracy: _currLocFromGeoCoder.speedAccuracy,
        altitudeAccuracy: _currLocFromGeoCoder.altitudeAccuracy,
        headingAccuracy: _currLocFromGeoCoder.headingAccuracy,
      );
    }
  }

/*
  static Future<Position> _getLocation({bool forceGPSUpdate = false}) async {
    try {
      if (isIOS) {
        final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: isAndroid && forceGPSUpdate,
          timeLimit: Duration(seconds: 10),
        );
      }
    }
    catch
    final location = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.
    high
    ,
    );
    return
    location;
  }
*/

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
    locationStreamSubs ??= Geolocator.getPositionStream(
      locationSettings: getLocationSetting(),
    )
        .asBroadcastStream()
        .shareValue()
        .throttleTime(Duration(seconds: 10), trailing: true)
        .listen((position) async {
      final locationModel = await _parseLocation(position);
      _setLocation(locationModel);
    });
  }

  void stopLocationFetchStream() {
    locationStreamSubs?.cancel();
  }

  void _setLocation(LocationModel location) {
    if (location != null) {
      _deviceLocation.value = location;
      //prefsHelper.lastLocation = jsonEncode(_deviceLocation.value.toJson());
    } else {
      throw LocationException(
        '${Constants.locationNotAvailable}\n$defaultLocationReason',
      );
    }
  }

  Future<LocationModel> _parseLocation(Position location) async {
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
      final locationData = LocationModel(
        latitude: location.latitude,
        longitude: location.longitude,
        accuracy: location.accuracy.toInt(),
        captureTime: location.timestamp.millisecondsSinceEpoch ~/ 1000,
        captureLocationTime: DateTimeUtils.getCurrentISOTimeString(
            dateTime: location.timestamp.toLocal()),
        source: isAndroid ? 'Android_geolocator' : (isIOS ? 'iOS' : 'Unknown'),
        capturedAddress: placemark?.getFullAddress() ?? null,
        placeMarkData: placemark,
      );
      return locationData;
    }
  }

  Future _fetchLocation() async {
    try {
      await _startFetchingLocation().timeout(const Duration(seconds: 10),
          onTimeout: () async {
        final position = await Geolocator.getCurrentPosition()
            .timeout(Duration(seconds: 10), onTimeout: () {
          throw Exception("Location Exception");
        });
        // if (position == null) {
        //   throw LocationException(
        //     '${Constants.locationNotAvailable}\n$defaultLocationReason',
        //   );
        // } else {
        await _onLocationFetch(position);
        // }
      });
    } catch (e, s) {
      logger.e(e, s);
      final _location = await Geolocator.getLastKnownPosition()
          .timeout(Duration(seconds: 5), onTimeout: () {
        throw LocationException('Unable to capture location');
      });
      if (_location != null) {
        final location = await _parseLocation(
          _location,
        );
        _deviceLocation.value = location;
      }
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

  Future<void> _startFetchingLocation() async {
    Position? location;
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
          if (navKey != null) {
            await navKey!.currentState!.push(
              MaterialPageRoute(
                builder: (_) => AppErrorPage(
                  LocationException(
                    '${Constants.locationNotAvailable}'
                    '\n$defaultLocationReason',
                  ),
                  onRetryTap: () {
                    initLocation();
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
  Future<String> getAddress({
    required double lat,
    required double lng,
  }) async {
    String _address = "";
    try {
      final placemark = await getPlacemarkDataFromCoordinates(
        latitude: lat,
        longitude: lng,
      );

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
        '${Constants.locationNotAvailable}\n$defaultLocationReason',
      );
    }
  }

  @override
  Stream<LocationModel> get locationStream {
    if (isIOS) {
      return Geolocator.getPositionStream(
        locationSettings: getLocationSetting(),
      )
          .asBroadcastStream()
          .shareValue()
          .throttleTime(Duration(seconds: 10), trailing: true)
          .transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) async {
            logger.i("Got data parsing location..");
            final locationModel = await _parseLocation(data);
            _setLocation(locationModel);
            await Future.delayed(Duration(milliseconds: 500));
            return sink.add(locationModel);
          },
        ),
      );
    } else {
      //Location works for Android, but doesn't support iOS 16 yet.
      return _location2.onLocationChanged
          .asBroadcastStream()
          .shareValue()
          .throttleTime(Duration(seconds: 15))
          .transform<LocationModel>(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) async {
            final locationModel = await _parseLocation2(data);
            _setLocation(locationModel);
            return sink.add(locationModel);
          },
        ),
      ).timeout(
        Duration(seconds: 15),
        onTimeout: (sink1) {
          // final _locationData = await _location2.getLocation();
          // final _locationModel = await _parseLocation2(_locationData);
          if (_deviceLocation.value != null) {
            return sink1.add(_deviceLocation.value!);
          }
        },
      );
    }
    /*if (isMobile && positionStream != null) {
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
    }*/
  }

  Future<LocationModel> _parseLocation2(LocationData location) async {
    final _address = await getAddress(
      lat: location.latitude!,
      lng: location.longitude!,
    );
    final _capturedTime =
        (location.time ?? DateTime.now().millisecondsSinceEpoch).toInt() ~/
            1000;
    final locationModel = LocationModel(
      latitude: location.latitude!,
      longitude: location.longitude!,
      accuracy: location.accuracy?.toInt() ?? 0,
      captureTime: _capturedTime,
      captureLocationTime: DateTimeUtils.getCurrentISOTimeString(
        dateTime: DateTime.fromMillisecondsSinceEpoch(_capturedTime),
      ),
      source: isAndroid ? 'Android_location' : (isIOS ? 'iOS' : 'Unknown'),
      capturedAddress: _address,
    );
    // await _nwLogger.sendLogViaNetwork(data: "_parseLocation - $_address");

    return locationModel;
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
  Future<LocationModel> getLocationWithPlacemarkData() async {
    final placemarkData = await getPlacemarkDataforNoGeocoding(
      latitude: currentLocation.latitude ?? 26.85,
      longitude: currentLocation.longitude ?? 80.94,
    );

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
}

extension PositionX on Position {
  LatLng get latLng => LatLng(latitude, longitude);
}
