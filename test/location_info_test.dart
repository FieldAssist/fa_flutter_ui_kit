import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';

/// Fake platform implementation used to drive [LocationInfoImpl] in tests
/// without touching real platform channels. Swapped in via
/// [GeolocatorPlatform.instance], the standard federated-plugin seam.
class _FakeGeolocatorPlatform extends GeolocatorPlatform {
  LocationPermission permission = LocationPermission.always;
  bool serviceEnabled = true;

  /// When set, [isLocationServiceEnabled] throws this instead of returning
  /// [serviceEnabled] - simulating the flaky Play Services failures seen on
  /// some OEM devices.
  Object? serviceCheckError;

  Position position = Position(
    latitude: 26.85,
    longitude: 80.94,
    timestamp: DateTime(2026),
    accuracy: 1,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  @override
  Future<LocationPermission> checkPermission() async => permission;

  @override
  Future<LocationPermission> requestPermission() async => permission;

  @override
  Future<bool> isLocationServiceEnabled() async {
    final error = serviceCheckError;
    if (error != null) throw error;
    return serviceEnabled;
  }

  @override
  Future<LocationAccuracyStatus> getLocationAccuracy() async =>
      LocationAccuracyStatus.precise;

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async =>
      position;

  @override
  Future<Position?> getLastKnownPosition({
    bool forceLocationManager = false,
  }) async =>
      position;

  @override
  Stream<Position> getPositionStream({LocationSettings? locationSettings}) =>
      const Stream<Position>.empty();
}

void main() {
  final originalGeolocatorPlatform = GeolocatorPlatform.instance;
  late _FakeGeolocatorPlatform fakePlatform;
  late GlobalKey<NavigatorState> navKey;
  late LocationInfoImpl locationInfo;

  setUp(() {
    fakePlatform = _FakeGeolocatorPlatform();
    GeolocatorPlatform.instance = fakePlatform;
    navKey = GlobalKey<NavigatorState>();
    locationInfo = LocationInfoImpl(navKey: navKey, enforceGeocoding: false)
      ..debugForceMobile = true;
  });

  tearDown(() {
    locationInfo.dispose();
    GeolocatorPlatform.instance = originalGeolocatorPlatform;
  });

  Future<void> pumpApp(WidgetTester tester) async {
    // Large enough viewport that AppErrorPage's content doesn't overflow.
    // Capture and restore the original values explicitly rather than using
    // resetPhysicalSize()/resetDevicePixelRatio(): those fall through to the
    // real host view's (non-deterministic) size instead of flutter_test's
    // synthetic default, which leaks a tiny/odd viewport into whichever
    // other test file's suite happens to run next.
    final originalSize = tester.view.physicalSize;
    final originalDevicePixelRatio = tester.view.devicePixelRatio;
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.physicalSize = originalSize;
      tester.view.devicePixelRatio = originalDevicePixelRatio;
    });

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navKey,
        home: const Scaffold(body: SizedBox()),
      ),
    );
  }

  group('isLocationEnabled / isLocationPermissionGranted', () {
    test('reflect the underlying platform state', () async {
      fakePlatform.serviceEnabled = true;
      fakePlatform.permission = LocationPermission.always;
      expect(await locationInfo.isLocationEnabled(), isTrue);
      expect(await locationInfo.isLocationPermissionGranted(), isTrue);

      fakePlatform.serviceEnabled = false;
      fakePlatform.permission = LocationPermission.denied;
      expect(await locationInfo.isLocationEnabled(), isFalse);
      expect(await locationInfo.isLocationPermissionGranted(), isFalse);
    });

    test('isLocationEnabled still surfaces platform exceptions', () async {
      fakePlatform.serviceCheckError =
          PlatformException(code: 'LOCATION_SERVICES_DISABLED');
      expect(
          locationInfo.isLocationEnabled(), throwsA(isA<PlatformException>()));
    });
  });

  group('_startLocationServiceCheckTimer (via initLocation)', () {
    testWidgets(
      'a single transient platform failure does not surface the error page',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        fakePlatform.serviceCheckError =
            PlatformException(code: 'LOCATION_SERVICES_DISABLED');
        await tester.pump(const Duration(seconds: 1));

        fakePlatform.serviceCheckError = null;
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();

        expect(find.byType(AppErrorPage), findsNothing);
        locationInfo.dispose();
      },
    );

    testWidgets(
      'two consecutive failed checks surface the error page',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        fakePlatform.serviceCheckError =
            PlatformException(code: 'LOCATION_SERVICES_DISABLED');
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();

        expect(find.byType(AppErrorPage), findsOneWidget);
        locationInfo.dispose();
      },
    );

    testWidgets(
      'a success between two failures resets the failure count',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        fakePlatform.serviceCheckError =
            PlatformException(code: 'LOCATION_SERVICES_DISABLED');
        await tester.pump(const Duration(seconds: 1));

        fakePlatform.serviceCheckError = null;
        await tester.pump(const Duration(seconds: 1));

        fakePlatform.serviceCheckError =
            PlatformException(code: 'LOCATION_SERVICES_DISABLED');
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();

        expect(find.byType(AppErrorPage), findsNothing);
        locationInfo.dispose();
      },
    );

    testWidgets(
      'a genuinely disabled service (no exception) still surfaces the error page',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        fakePlatform.serviceEnabled = false;
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();

        expect(find.byType(AppErrorPage), findsOneWidget);
        locationInfo.dispose();
      },
    );
  });
}
