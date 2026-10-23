import 'dart:async';
import 'dart:math';

import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_guide.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/widgets/image_capture_button.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/config/ui_common_colors.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/config/ui_common_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensors_plus/sensors_plus.dart';

AccelerometerEvent _rolled(double degrees) {
  final r = degrees * pi / 180;
  return AccelerometerEvent(
      9.81 * sin(r), 9.81 * cos(r), 0, DateTime(2026, 10, 23));
}

void main() {
  group('CameraGuide', () {
    late StreamController<AccelerometerEvent> events;

    setUp(() => events = StreamController<AccelerometerEvent>());

    tearDown(() => events.close());

    Future<void> pump(WidgetTester tester, {bool showOnOpen = false}) =>
        tester.pumpWidget(
          MaterialApp(
            home: CameraGuide(
              config: CameraGuideConfig(
                maxRollDegrees: 10,
                guide: const ColoredBox(
                  color: Colors.black54,
                  child: Center(child: Text('GUIDE')),
                ),
                showOnOpen: showOnOpen,
              ),
              events: events.stream,
              builder: (_, state) => Stack(
                children: [
                  Column(
                    children: [
                      Text('level=${state.isLevel}'),
                      TextButton(
                        onPressed: state.openGuide,
                        child: const Text('open'),
                      ),
                    ],
                  ),
                  if (state.overlay != null)
                    Positioned.fill(child: state.overlay!),
                ],
              ),
            ),
          ),
        );

    Future<void> tilt(WidgetTester tester, double degrees) async {
      events.add(_rolled(degrees));
      // a later reading can land one frame after the event
      await tester.pump();
      await tester.pump();
    }

    testWidgets('CameraGuide: showOnOpen → guide visible on open',
        (tester) async {
      await pump(tester, showOnOpen: true);

      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: shown on open, tap → dismissed', (tester) async {
      await pump(tester, showOnOpen: true);

      await tester.tap(find.text('GUIDE'));
      await tester.pump();

      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: showOnOpen false → no guide', (tester) async {
      await pump(tester);

      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: openGuide → visible, tap → dismissed',
        (tester) async {
      await pump(tester);
      await tester.tap(find.text('open'));
      await tester.pump();
      expect(find.text('GUIDE'), findsOneWidget);

      await tester.tap(find.text('GUIDE'));
      await tester.pump();

      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: tilted 30° → guide shown, not level',
        (tester) async {
      await pump(tester);

      await tilt(tester, 30);

      expect(find.text('GUIDE'), findsOneWidget);
      expect(find.text('level=false'), findsOneWidget);
    });

    testWidgets('CameraGuide: tilted, tap → guide stays', (tester) async {
      await pump(tester);
      await tilt(tester, 30);

      await tester.tap(find.text('GUIDE'));
      await tester.pump();

      // a tilt-forced guide cannot be skipped
      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: tilted then straight → guide hides itself',
        (tester) async {
      await pump(tester);
      await tilt(tester, 30);

      await tilt(tester, 0);

      expect(find.text('GUIDE'), findsNothing);
      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('CameraGuide: tilted then 9° → guide still shown',
        (tester) async {
      await pump(tester);
      await tilt(tester, 30);

      await tilt(tester, 9);

      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets(
        'CameraGuide: opened by button, tilted, straight → stays until tapped',
        (tester) async {
      await pump(tester);
      await tester.tap(find.text('open'));
      await tilt(tester, 30);

      await tilt(tester, 0);

      // the user asked for it and has not dismissed it yet
      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: opened by button, tap while tilted → stays',
        (tester) async {
      await pump(tester);
      await tester.tap(find.text('open'));
      await tilt(tester, 30);

      await tester.tap(find.text('GUIDE'));
      await tester.pump();

      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: sensor error → level, no guide', (tester) async {
      await pump(tester);

      events.addError(Exception('no accelerometer'));
      // a stream error reaches the builder one frame after the event
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
      expect(find.text('GUIDE'), findsNothing);
    });
  });

  group('CameraGuideButton', () {
    Widget appBar({required VoidCallback onPressed, double textScale = 1}) =>
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: const Size(320, 640),
              textScaler: TextScaler.linear(textScale),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Take Picture'),
                actions: [
                  CameraGuideButton(onPressed: onPressed),
                  const IconButton(
                      onPressed: null, icon: Icon(Icons.document_scanner)),
                ],
              ),
            ),
          ),
        );

    testWidgets('CameraGuideButton: shows the Guide label', (tester) async {
      await tester.pumpWidget(appBar(onPressed: () {}));

      expect(find.text(UiCommonTexts().kGuide), findsOneWidget);
    });

    testWidgets('CameraGuideButton: tap → onPressed once', (tester) async {
      var taps = 0;
      await tester.pumpWidget(appBar(onPressed: () => taps++));

      await tester.tap(find.text(UiCommonTexts().kGuide));

      expect(taps, 1);
    });

    testWidgets('CameraGuideButton: 2x text scale in an app bar → no overflow',
        (tester) async {
      await tester.pumpWidget(appBar(onPressed: () {}, textScale: 2));

      expect(tester.takeException(), isNull);
    });
  });

  group('ImageCaptureButton', () {
    const primary = Colors.indigo;

    Future<void> pump(
      WidgetTester tester, {
      required bool enabled,
      bool emphasizeState = false,
      VoidCallback? onTakePhoto,
    }) =>
        tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: primary)),
            home: Scaffold(
              body: ImageCaptureButton(
                onTakePhoto: onTakePhoto ?? () {},
                enabled: enabled,
                emphasizeState: emphasizeState,
              ),
            ),
          ),
        );

    FloatingActionButton fab(WidgetTester tester) =>
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));

    Icon icon(WidgetTester tester) => tester.widget<Icon>(find.byType(Icon));

    testWidgets('ImageCaptureButton: disabled → tap does not take a photo',
        (tester) async {
      var taps = 0;
      await pump(tester, enabled: false, onTakePhoto: () => taps++);

      await tester.tap(find.byType(FloatingActionButton));

      expect(taps, 0);
    });

    testWidgets('ImageCaptureButton: not emphasized → today\'s white shutter',
        (tester) async {
      await pump(tester, enabled: true);

      expect(fab(tester).backgroundColor, UiCommonColors.kWhite);
      expect(icon(tester).color, UiCommonColors.kBlack54);
    });

    testWidgets(
        'ImageCaptureButton: emphasized, enabled → primary + white icon',
        (tester) async {
      await pump(tester, enabled: true, emphasizeState: true);
      final scheme =
          Theme.of(tester.element(find.byType(Scaffold))).colorScheme;

      expect(fab(tester).backgroundColor, scheme.primary);
      expect(icon(tester).color, UiCommonColors.kWhite);
    });

    testWidgets('ImageCaptureButton: emphasized, disabled → grey + grey icon',
        (tester) async {
      await pump(tester, enabled: false, emphasizeState: true);

      expect(fab(tester).backgroundColor, UiCommonColors.kGreyM);
      expect(icon(tester).color, UiCommonColors.kGrey500);
    });
  });
}
