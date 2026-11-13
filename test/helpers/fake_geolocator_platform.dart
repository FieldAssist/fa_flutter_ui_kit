import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';

/// Answers `isLocationServiceEnabled` with whatever the test supplies and
/// counts requests to open the location settings page. The fix-related
/// answers default to "permission granted, no fix anywhere".
class FakeGeolocatorPlatform extends GeolocatorPlatform {
  FakeGeolocatorPlatform(this._isLocationServiceEnabled);

  final Future<bool> Function() _isLocationServiceEnabled;

  /// Answers `getCurrentPosition`. Null: no fix within the time limit, as
  /// geolocator reports it.
  Future<Position> Function()? currentPosition;

  Position? lastKnownPosition;

  LocationPermission permission = LocationPermission.whileInUse;

  int openLocationSettingsCalls = 0;

  int currentPositionCalls = 0;

  @override
  Future<bool> isLocationServiceEnabled() => _isLocationServiceEnabled();

  @override
  Future<bool> openLocationSettings() async {
    openLocationSettingsCalls++;
    return true;
  }

  @override
  Future<LocationPermission> checkPermission() async => permission;

  @override
  Future<Position> getCurrentPosition({LocationSettings? locationSettings}) {
    currentPositionCalls++;
    final answer = currentPosition;
    if (answer == null) {
      return Future.error(
        TimeoutException('no fix', locationSettings?.timeLimit),
      );
    }
    return answer();
  }

  @override
  Future<Position?> getLastKnownPosition({
    bool forceLocationManager = false,
  }) async =>
      lastKnownPosition;

  @override
  Stream<Position> getPositionStream({LocationSettings? locationSettings}) =>
      const Stream.empty();
}
