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

    setUp(() => events = StreamController<AccelerometerEvent>.broadcast());

    tearDown(() => events.close());

    Future<void> pump(WidgetTester tester, {bool withGuide = true}) =>
        tester.pumpWidget(
          MaterialApp(
            home: CameraGuide(
              guide: withGuide
                  ? const ColoredBox(
                      color: Colors.black54,
                      child: Center(child: Text('GUIDE')),
                    )
                  : null,
              events: events.stream,
              builder: (_, isLevel, overlay, openGuide) => Stack(
                children: [
                  Column(
                    children: [
                      Text('level=$isLevel'),
                      if (openGuide != null)
                        TextButton(
                          onPressed: openGuide,
                          child: const Text('open'),
                        ),
                    ],
                  ),
                  if (overlay != null) Positioned.fill(child: overlay),
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

    Future<void> openGuide(WidgetTester tester) async {
      await tester.tap(find.text('open'));
      await tester.pump();
    }

    Future<void> lifecycle(WidgetTester tester, AppLifecycleState s) async {
      tester.binding.handleAppLifecycleStateChanged(s);
      await tester.pump();
    }

    testWidgets('CameraGuide: camera opens → level, no guide', (tester) async {
      await pump(tester);

      expect(find.text('GUIDE'), findsNothing);
      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('CameraGuide: no guide → plain camera, no Guide action',
        (tester) async {
      await pump(tester, withGuide: false);

      expect(find.text('open'), findsNothing);
      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('CameraGuide: no guide → sensor never listened to',
        (tester) async {
      await pump(tester, withGuide: false);

      await tilt(tester, 30);

      expect(events.hasListener, isFalse);
      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('CameraGuide: phone flat → level, no guide', (tester) async {
      await pump(tester);

      events.add(AccelerometerEvent(0, 0, 9.81, DateTime(2026, 10, 23)));
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: tilted then sensor error → level, guide gone',
        (tester) async {
      await pump(tester);
      await tilt(tester, 30);

      events.addError(Exception('sensor lost'));
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: camera closed → sensor released', (tester) async {
      await pump(tester);

      await tester.pumpWidget(const SizedBox());

      expect(events.hasListener, isFalse);
    });

    testWidgets('CameraGuide: Guide tapped → guide shown', (tester) async {
      await pump(tester);

      await openGuide(tester);

      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: opened by Guide, tap anywhere → closed',
        (tester) async {
      await pump(tester);
      await openGuide(tester);

      await tester.tap(find.text('GUIDE'));
      await tester.pump();

      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: opened by Guide, left alone → keeps looping',
        (tester) async {
      await pump(tester);
      await openGuide(tester);

      await tester.pump(const Duration(minutes: 1));

      expect(find.text('GUIDE'), findsOneWidget);
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

      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: tilted then straight → guide closes itself',
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
        'CameraGuide: opened by Guide, tilted, straight → stays until tapped',
        (tester) async {
      await pump(tester);
      await openGuide(tester);
      await tilt(tester, 30);

      await tilt(tester, 0);

      // the user asked for it and has not closed it yet
      expect(find.text('GUIDE'), findsOneWidget);
    });

    testWidgets('CameraGuide: sensor error → level, no guide', (tester) async {
      await pump(tester);

      events.addError(Exception('no accelerometer'));
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: app backgrounded → sensor released',
        (tester) async {
      await pump(tester);

      await lifecycle(tester, AppLifecycleState.paused);

      expect(events.hasListener, isFalse);
    });

    testWidgets('CameraGuide: app back in foreground → sensor listened again',
        (tester) async {
      await pump(tester);
      await lifecycle(tester, AppLifecycleState.paused);

      await lifecycle(tester, AppLifecycleState.resumed);

      expect(events.hasListener, isTrue);
    });

    testWidgets(
        'CameraGuide: tilted, backgrounded and back → closed until next reading',
        (tester) async {
      await pump(tester);
      await tilt(tester, 30);
      // a paused app draws no frames, so check once it is back
      await lifecycle(tester, AppLifecycleState.paused);

      await lifecycle(tester, AppLifecycleState.resumed);

      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: opened by Guide, app backgrounded → closed',
        (tester) async {
      await pump(tester);
      await openGuide(tester);
      await lifecycle(tester, AppLifecycleState.paused);

      await lifecycle(tester, AppLifecycleState.resumed);

      // nothing left playing behind or after the background trip
      expect(find.text('GUIDE'), findsNothing);
    });

    testWidgets('CameraGuide: backgrounded while tilted, resumed level → ok',
        (tester) async {
      await pump(tester);
      await tilt(tester, 30);
      await lifecycle(tester, AppLifecycleState.paused);
      await lifecycle(tester, AppLifecycleState.resumed);

      await tilt(tester, 0);

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
