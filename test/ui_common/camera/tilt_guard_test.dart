import 'dart:math';

import 'package:fa_flutter_ui_kit/src/ui_common/camera/tilt_guard.dart';
import 'package:flutter_test/flutter_test.dart';

const _g = 9.81;

double _rad(double deg) => deg * pi / 180;

/// Gravity as the accelerometer reports it for a phone rolled [roll]° and
/// leaned back [pitch]° from upright portrait.
({double x, double y, double z}) _gravity(double roll, {double pitch = 0}) => (
      x: _g * cos(_rad(pitch)) * sin(_rad(roll)),
      y: _g * cos(_rad(pitch)) * cos(_rad(roll)),
      z: _g * sin(_rad(pitch)),
    );

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
}
