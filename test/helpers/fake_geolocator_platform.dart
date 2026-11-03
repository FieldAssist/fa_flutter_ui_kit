import 'package:fa_flutter_core/fa_flutter_core.dart';

/// Answers `isLocationServiceEnabled` with whatever the test supplies and
/// counts requests to open the location settings page.
class FakeGeolocatorPlatform extends GeolocatorPlatform {
  FakeGeolocatorPlatform(this._isLocationServiceEnabled);

  final Future<bool> Function() _isLocationServiceEnabled;

  int openLocationSettingsCalls = 0;

  @override
  Future<bool> isLocationServiceEnabled() => _isLocationServiceEnabled();

  @override
  Future<bool> openLocationSettings() async {
    openLocationSettingsCalls++;
    return true;
  }
}
