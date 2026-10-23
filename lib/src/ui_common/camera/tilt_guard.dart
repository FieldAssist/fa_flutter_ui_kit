import 'dart:math';

/// Sideways rotation from upright portrait in degrees, from accelerometer
/// gravity: 0 upright, ±90 landscape, ±180 upside-down. Leaning forward or
/// back does not change it. Null when the phone is within 30° of flat, where
/// the in-plane gravity is too small to give a stable angle.
double? rollDegrees(double x, double y, double z) {
  final inPlane = sqrt(x * x + y * y);
  if (inPlane == 0 || inPlane < sqrt(x * x + y * y + z * z) / 2) {
    return null;
  }
  return atan2(x, y) * 180 / pi;
}

/// Whether capture is allowed after the reading [roll]. Tilts past [max];
/// once tilted, levels again only below `max - 2` so a hand-held phone near
/// the limit does not flicker. A null roll (flat) always allows.
// ponytail: fixed 2° band, make it a param if a caller needs another.
bool nextIsLevel({
  required bool wasLevel,
  required double? roll,
  required double max,
}) {
  if (roll == null) {
    return true;
  }
  return wasLevel ? roll.abs() <= max : roll.abs() < max - 2;
}
