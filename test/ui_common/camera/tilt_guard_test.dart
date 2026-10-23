import 'dart:async';
import 'dart:math';

import 'package:fa_flutter_ui_kit/src/ui_common/camera/tilt_guard.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/widgets/image_capture_button.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/config/ui_common_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensors_plus/sensors_plus.dart';

const _g = 9.81;

double _rad(double deg) => deg * pi / 180;

/// Gravity as the accelerometer reports it for a phone rolled [roll]° and
/// leaned back [pitch]° from upright portrait.
({double x, double y, double z}) _gravity(double roll, {double pitch = 0}) => (
      x: _g * cos(_rad(pitch)) * sin(_rad(roll)),
      y: _g * cos(_rad(pitch)) * cos(_rad(roll)),
      z: _g * sin(_rad(pitch)),
    );

AccelerometerEvent _event(double roll, {double pitch = 0}) {
  final v = _gravity(roll, pitch: pitch);
  return AccelerometerEvent(v.x, v.y, v.z, DateTime(2026, 10, 23));
}

void main() {
  group('rollDegrees', () {
    for (final (name, roll, pitch, expected) in [
      ('upright', 0.0, 0.0, 0.0),
      ('10° right', 10.0, 0.0, 10.0),
      ('10° left', -10.0, 0.0, -10.0),
      ('landscape right', 90.0, 0.0, 90.0),
      ('landscape left', -90.0, 0.0, -90.0),
      ('upright leaned back 40°', 0.0, 40.0, 0.0),
      ('15° roll leaned back 40°', 15.0, 40.0, 15.0),
      ('35° from flat', 0.0, 55.0, 0.0),
    ]) {
      test('rollDegrees: $name → $expected°', () {
        final v = _gravity(roll, pitch: pitch);

        expect(rollDegrees(v.x, v.y, v.z), closeTo(expected, 0.01));
      });
    }

    test('rollDegrees: upside-down → ±180°', () {
      expect(rollDegrees(0, -_g, 0)!.abs(), closeTo(180, 0.01));
    });

    test('rollDegrees: half gravity upright → 0° (magnitude-independent)', () {
      expect(rollDegrees(0, _g / 2, 0), closeTo(0, 0.01));
    });

    for (final (name, x, y, z) in [
      ('flat on table', 0.0, 0.0, _g),
      ('25° from flat', 0.0, _g * cos(_rad(65)), _g * sin(_rad(65))),
      ('zero vector', 0.0, 0.0, 0.0),
    ]) {
      test('rollDegrees: $name → null (roll not measurable)', () {
        expect(rollDegrees(x, y, z), isNull);
      });
    }
  });

  group('nextIsLevel with max 10°', () {
    for (final (wasLevel, roll, expected) in [
      (true, 0.0, true),
      (true, 9.9, true),
      (true, 10.0, true),
      (true, 10.1, false),
      (true, -10.1, false),
      (true, 90.0, false),
      (true, 180.0, false),
      (true, 9.5, true),
      (false, 9.0, false),
      (false, 8.0, false),
      (false, 7.9, true),
      (false, -7.9, true),
      (false, null, true),
      (true, null, true),
    ]) {
      test('nextIsLevel: wasLevel=$wasLevel, roll=$roll → $expected', () {
        expect(
          nextIsLevel(wasLevel: wasLevel, roll: roll, max: 10),
          expected,
        );
      });
    }

    test('nextIsLevel: jitter around 10° after tilting → stays tilted', () {
      var level = true;
      final seen = <bool>[];

      for (final roll in [10.1, 9.5, 10.2, 9.0]) {
        level = nextIsLevel(wasLevel: level, roll: roll, max: 10);
        seen.add(level);
      }

      expect(seen, [false, false, false, false]);
    });
  });

  group('TiltGuard', () {
    late StreamController<AccelerometerEvent> events;

    setUp(() => events = StreamController<AccelerometerEvent>());

    tearDown(() => events.close());

    Widget guard() => MaterialApp(
          home: TiltGuard(
            maxRollDegrees: 10,
            events: events.stream,
            builder: (_, isLevel) => Text('level=$isLevel'),
          ),
        );

    testWidgets('TiltGuard: no reading yet → level', (tester) async {
      await tester.pumpWidget(guard());

      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('TiltGuard: 30° reading → tilted', (tester) async {
      await tester.pumpWidget(guard());

      events.add(_event(30));
      await tester.pump();

      expect(find.text('level=false'), findsOneWidget);
    });

    testWidgets('TiltGuard: 30° then upright → level', (tester) async {
      await tester.pumpWidget(guard());

      events
        ..add(_event(30))
        ..add(_event(0));
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('TiltGuard: phone flat → level', (tester) async {
      await tester.pumpWidget(guard());

      events.add(AccelerometerEvent(0, 0, _g, DateTime(2026, 10, 23)));
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('TiltGuard: sensor error → level, no exception',
        (tester) async {
      await tester.pumpWidget(guard());

      events.addError(Exception('no accelerometer'));
      // a stream error reaches the builder one frame after the event
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('TiltGuard: tilted then sensor error → level', (tester) async {
      await tester.pumpWidget(guard());
      events.add(_event(30));
      await tester.pump();

      events.addError(Exception('sensor lost'));
      // a stream error reaches the builder one frame after the event
      await tester.pump();
      await tester.pump();

      expect(find.text('level=true'), findsOneWidget);
    });

    testWidgets('TiltGuard: removed from tree → stops listening',
        (tester) async {
      await tester.pumpWidget(guard());

      await tester.pumpWidget(const SizedBox());

      expect(events.hasListener, isFalse);
    });
  });

  group('TiltWarningBanner', () {
    Widget banner({double textScale = 1}) => MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: const Size(320, 640),
              textScaler: TextScaler.linear(textScale),
            ),
            child: const Scaffold(
              body: Align(
                alignment: Alignment.topCenter,
                child: TiltWarningBanner(),
              ),
            ),
          ),
        );

    testWidgets('TiltWarningBanner: shows the hold-straight message',
        (tester) async {
      await tester.pumpWidget(banner());

      expect(find.text(UiCommonTexts().kHoldPhoneStraight), findsOneWidget);
    });

    testWidgets('TiltWarningBanner: is a live region for screen readers',
        (tester) async {
      final semantics = tester.ensureSemantics();

      await tester.pumpWidget(banner());

      expect(
        tester.getSemantics(find.byType(TiltWarningBanner)),
        containsSemantics(isLiveRegion: true),
      );
      semantics.dispose();
    });

    testWidgets('TiltWarningBanner: 2x text scale → no overflow',
        (tester) async {
      await tester.pumpWidget(banner(textScale: 2));

      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('ImageCaptureButton: disabled → tap does not take a photo',
      (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ImageCaptureButton(onTakePhoto: () => taps++, enabled: false),
        ),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));

    expect(taps, 0);
  });
}
