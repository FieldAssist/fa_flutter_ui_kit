import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/location_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_geolocator_platform.dart';

void main() {
  late GeolocatorPlatform originalPlatform;

  setUp(() => originalPlatform = GeolocatorPlatform.instance);

  tearDown(() => GeolocatorPlatform.instance = originalPlatform);

  testWidgets(
      'Open Settings: plugin throws LOCATION_SERVICES_DISABLED '
      '→ opens location settings', (tester) async {
    final platform = FakeGeolocatorPlatform(
      () async => throw PlatformException(code: 'LOCATION_SERVICES_DISABLED'),
    );
    GeolocatorPlatform.instance = platform;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              LocationErrorWidget(
                error: 'Location is off',
                hasSettingButton: true,
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Settings'));
    await tester.pump();

    expect(platform.openLocationSettingsCalls, 1);
  });
}
