import 'dart:async';
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
/// The sensor is listened to only while the app is in the foreground.
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

class _TiltGuardState extends State<TiltGuard> with WidgetsBindingObserver {
  late final Stream<AccelerometerEvent> _events = widget.events ??
      accelerometerEventStream(samplingPeriod: SensorInterval.uiInterval);
  StreamSubscription<AccelerometerEvent>? _subscription;
  bool _isLevel = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listen();
  }

  void _listen() {
    var level = true;
    _subscription ??= _events.listen(
      (e) {
        level = nextIsLevel(
          wasLevel: level,
          roll: rollDegrees(e.x, e.y, e.z),
          max: widget.maxRollDegrees,
        );
        _show(level);
      },
      onError: (Object _) => _show(true),
    );
  }

  void _release() {
    unawaited(_subscription?.cancel());
    _subscription = null;
    _show(true);
  }

  // Only flips between level and tilted rebuild; readings in between do not.
  void _show(bool level) {
    if (mounted && level != _isLevel) {
      setState(() => _isLevel = level);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      state == AppLifecycleState.resumed ? _listen() : _release();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _isLevel);
}
