import 'dart:async';

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

  /// When set, [isLocationServiceEnabled] waits this long before resolving -
  /// simulating a slow platform call that outlives a single 1s timer tick.
  Duration? serviceCheckDelay;

  /// Number of times [getPositionStream] has been called - each
  /// resubscribe (initial connect or reconnect-after-error) calls it once.
  int positionStreamCallCount = 0;

  StreamController<Position>? _positionStreamController;

  /// The controller backing the most recent [getPositionStream] call, so
  /// tests can push position/error events into the currently-active stream.
  StreamController<Position> get positionStreamController {
    final controller = _positionStreamController;
    if (controller == null) {
      throw StateError('getPositionStream has not been called yet');
    }
    return controller;
  }

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
    final delay = serviceCheckDelay;
    if (delay != null) await Future<void>.delayed(delay);
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
  Stream<Position> getPositionStream({LocationSettings? locationSettings}) {
    positionStreamCallCount++;
    final controller = StreamController<Position>();
    _positionStreamController = controller;
    return controller.stream;
  }
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

  group('re-entry guard', () {
    testWidgets(
      'a slow platform check spanning multiple ticks is not double-counted',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        // Each check takes 2.5s to resolve - longer than the 1s tick
        // interval. Without the re-entry guard, the ticks that fire while a
        // check is still in flight would each start their own check and
        // independently increment the failure counter, surfacing the error
        // page well before two *completed* failed checks have happened.
        fakePlatform.serviceCheckDelay = const Duration(milliseconds: 2500);
        fakePlatform.serviceCheckError =
            PlatformException(code: 'LOCATION_SERVICES_DISABLED');

        // First check: starts at t=1s, resolves (fails) at t=3.5s.
        // Second check: starts at t=4s, resolves (fails) at t=6.5s.
        await tester.pump(const Duration(seconds: 6));
        expect(find.byType(AppErrorPage), findsNothing);

        await tester.pump(const Duration(seconds: 1));
        await tester.pump();
        expect(find.byType(AppErrorPage), findsOneWidget);

        locationInfo.dispose();
      },
    );
  });

  group('dispose', () {
    testWidgets(
      'cancels the check timer and stream subscription, leaving no pending timers',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        expect(locationInfo.locationCheckTimer?.isActive, isTrue);
        expect(locationInfo.positionStream, isNotNull);

        locationInfo.dispose();

        expect(locationInfo.locationCheckTimer, isNull);
        expect(locationInfo.locationStreamSubs, isNull);
        expect(locationInfo.positionStream, isNull);

        // If dispose() left the check timer or a reconnect timer pending,
        // flutter_test's end-of-test invariant check would fail this test.
        await tester.pump(const Duration(seconds: 15));
      },
    );
  });

  group('_startLocationFetchStream reconnect backoff', () {
    testWidgets(
      'schedules a reconnect after a stream error and resubscribes',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        expect(fakePlatform.positionStreamCallCount, 1);
        expect(locationInfo.positionStream, isNotNull);

        fakePlatform.positionStreamController.addError(
          PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
        );
        await tester.pump();

        expect(locationInfo.positionStream, isNull);
        expect(locationInfo.locationStreamSubs, isNull);

        // First backoff delay is 2s.
        await tester.pump(const Duration(seconds: 2));

        expect(fakePlatform.positionStreamCallCount, 2);
        expect(locationInfo.positionStream, isNotNull);

        locationInfo.dispose();
      },
    );

    testWidgets(
      'escalates through the delay list on consecutive automatic failures',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        // Fail immediately after each reconnect attempt. If the backoff
        // counter were reset on every call to _startLocationFetchStream
        // (rather than only on a fresh start), this would retry every 2s
        // forever instead of escalating to 5s then 10s and giving up.
        for (final delay in const [
          Duration(seconds: 2),
          Duration(seconds: 5),
          Duration(seconds: 10),
        ]) {
          fakePlatform.positionStreamController.addError(
            PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
          );
          await tester.pump();
          expect(locationInfo.positionStream, isNull);

          final callCountBefore = fakePlatform.positionStreamCallCount;
          await tester.pump(delay);
          expect(fakePlatform.positionStreamCallCount, callCountBefore + 1);
        }

        // The 4th failure exhausts all 3 attempts - no further reconnect
        // is scheduled.
        fakePlatform.positionStreamController.addError(
          PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
        );
        await tester.pump();
        final callCountAfterExhaustion = fakePlatform.positionStreamCallCount;

        await tester.pump(const Duration(seconds: 30));
        expect(fakePlatform.positionStreamCallCount, callCountAfterExhaustion);
        expect(locationInfo.positionStream, isNull);

        locationInfo.dispose();
      },
    );

    testWidgets(
      'a fresh start after exhaustion resets the backoff instead of giving up immediately',
      (tester) async {
        await pumpApp(tester);
        await locationInfo.initLocation();
        await tester.pump();

        // Exhaust all 3 automatic reconnect attempts.
        for (final delay in const [
          Duration(seconds: 2),
          Duration(seconds: 5),
          Duration(seconds: 10),
        ]) {
          fakePlatform.positionStreamController.addError(
            PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
          );
          await tester.pump();
          await tester.pump(delay);
        }
        fakePlatform.positionStreamController.addError(
          PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
        );
        await tester.pump();
        expect(locationInfo.positionStream, isNull);

        // Simulate the user hitting Retry: initLocation() runs again and
        // calls _startLocationFetchStream(isFreshStart: true).
        final callCountBeforeRetry = fakePlatform.positionStreamCallCount;
        await locationInfo.initLocation();
        await tester.pump();
        expect(fakePlatform.positionStreamCallCount, callCountBeforeRetry + 1);

        // If the exhaustion state had leaked through, this error would be
        // treated as attempt 4 and no reconnect would be scheduled at all.
        fakePlatform.positionStreamController.addError(
          PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
        );
        await tester.pump();

        final callCountAfterRestart = fakePlatform.positionStreamCallCount;
        await tester.pump(const Duration(seconds: 2));
        expect(fakePlatform.positionStreamCallCount, callCountAfterRestart + 1);

        locationInfo.dispose();
      },
    );
  });
}
