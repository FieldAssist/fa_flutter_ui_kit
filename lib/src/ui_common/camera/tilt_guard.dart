import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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

/// Rebuilds [builder] with whether the phone is held within
/// [maxRollDegrees] of upright. Level until the first reading and whenever
/// the sensor errors, so a phone without an accelerometer is never blocked.
class TiltGuard extends StatefulWidget {
  const TiltGuard({
    required this.maxRollDegrees,
    required this.builder,
    this.events,
    super.key,
  });

  final double maxRollDegrees;
  final Widget Function(BuildContext context, bool isLevel) builder;

  /// Accelerometer readings; the device sensor when null.
  final Stream<AccelerometerEvent>? events;

  @override
  State<TiltGuard> createState() => _TiltGuardState();
}

class _TiltGuardState extends State<TiltGuard> {
  late final Stream<bool> _isLevel = _levelStream();

  Stream<bool> _levelStream() {
    var level = true;
    final events = widget.events ??
        accelerometerEventStream(samplingPeriod: SensorInterval.uiInterval);
    return events
        .map(
          (e) => level = nextIsLevel(
            wasLevel: level,
            roll: rollDegrees(e.x, e.y, e.z),
            max: widget.maxRollDegrees,
          ),
        )
        .distinct();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
        stream: _isLevel,
        initialData: true,
        builder: (context, snapshot) =>
            widget.builder(context, snapshot.hasError || snapshot.data!),
      );
}
