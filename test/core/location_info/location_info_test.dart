import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/location_exception.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/location_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_geolocator_platform.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  const nativeChannel = MethodChannel('com.fieldassist.location_channel');

  late GeolocatorPlatform originalPlatform;
  late LocationInfoImpl locationInfo;

  Position position(double latitude, double longitude) => Position(
        latitude: latitude,
        longitude: longitude,
        timestamp: DateTime.utc(2026, 11, 13),
        accuracy: 5,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );

  FakeGeolocatorPlatform locationOn() {
    final fake = FakeGeolocatorPlatform(() async => true);
    GeolocatorPlatform.instance = fake;
    return fake;
  }

  setUp(() {
    originalPlatform = GeolocatorPlatform.instance;
    locationInfo = LocationInfoImpl(navKey: null, enforceGeocoding: false);
  });

  tearDown(() async {
    // a fix starts the 1s location-off watcher
    await locationInfo.stopLocationUpdates();
    GeolocatorPlatform.instance = originalPlatform;
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    debugDefaultTargetPlatformOverride = null;
    binding.defaultBinaryMessenger
        .setMockMethodCallHandler(nativeChannel, null);
  });

  test(
      'isLocationEnabled: plugin throws LOCATION_SERVICES_DISABLED '
      '→ returns false', () async {
    GeolocatorPlatform.instance = FakeGeolocatorPlatform(
      () async => throw PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
    );

    final isEnabled = await locationInfo.isLocationEnabled();

    expect(isEnabled, isFalse);
  });

  test('isLocationEnabled: any other PlatformException → rethrows', () async {
    GeolocatorPlatform.instance = FakeGeolocatorPlatform(
      () async => throw PlatformException(code: 'ACTIVITY_MISSING'),
    );

    // only the disabled-service code means "off"; other failures still surface
    await expectLater(
      locationInfo.isLocationEnabled(),
      throwsA(isA<PlatformException>()),
    );
  });

  group('fetchLocation', () {
    test('GPS fix in time → it is the current location', () async {
      locationOn().currentPosition = () async => position(28.6, 77.2);

      await locationInfo.fetchLocation();

      expect(
        (
          locationInfo.currentLocation.latitude,
          locationInfo.currentLocation.longitude,
        ),
        (28.6, 77.2),
      );
    });

    test('no GPS fix, a last known position → that is the location', () async {
      locationOn().lastKnownPosition = position(19.0, 72.8);

      await locationInfo.fetchLocation();

      expect(locationInfo.currentLocation.latitude, 19.0);
    });

    test('no fix and no fallback, app in front → LocationTimeoutException',
        () async {
      locationOn();
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      // a type of its own, so a crash reporter can tell it from a setting
      await expectLater(
        locationInfo.fetchLocation(),
        throwsA(
          isA<LocationTimeoutException>().having(
            (e) => e.message,
            'message',
            'Location not available!',
          ),
        ),
      );
    });

    test('no fix while the app is in the background → tries again on return',
        () async {
      final fake = locationOn();
      // iOS: no native fallback, so nothing leaves the microtask queue
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

      final fetch = locationInfo.fetchLocation();
      // parks on the resume after the first attempt finds nothing
      await Future<void>.delayed(Duration.zero);
      fake.currentPosition = () async => position(12.9, 77.6);
      // the order the engine reports a return to the app
      for (final state in [
        AppLifecycleState.hidden,
        AppLifecycleState.inactive,
        AppLifecycleState.resumed,
      ]) {
        binding.handleAppLifecycleStateChanged(state);
      }
      await fetch;

      expect(
        (fake.currentPositionCalls, locationInfo.currentLocation.latitude),
        (2, 12.9),
      );
    });

    test('no fix, no last known, Android → the native fused fix is used',
        () async {
      locationOn();
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        nativeChannel,
        (_) async => <String, Object>{
          'latitude': 22.5,
          'longitude': 88.3,
          'accuracy': 30,
        },
      );

      await locationInfo.fetchLocation();

      expect(
        (
          locationInfo.currentLocation.latitude,
          locationInfo.currentLocation.longitude,
        ),
        (22.5, 88.3),
      );
    });

    test(
        'no fix, Android app without the native channel → '
        'LocationTimeoutException', () async {
      locationOn();
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await expectLater(
        locationInfo.fetchLocation(),
        throwsA(isA<LocationTimeoutException>()),
      );
    });
  });

  test('stopLocationUpdates: a fix was taken → the location-off watcher stops',
      () async {
    locationOn().currentPosition = () async => position(28.6, 77.2);
    await locationInfo.fetchLocation();

    await locationInfo.stopLocationUpdates();

    expect(locationInfo.locationCheckTimer?.isActive, isFalse);
  });
}
