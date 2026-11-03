import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/location_info/location_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_geolocator_platform.dart';

void main() {
  late GeolocatorPlatform originalPlatform;
  late LocationInfoImpl locationInfo;

  setUp(() {
    originalPlatform = GeolocatorPlatform.instance;
    locationInfo = LocationInfoImpl(navKey: null);
  });

  tearDown(() => GeolocatorPlatform.instance = originalPlatform);

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
}
