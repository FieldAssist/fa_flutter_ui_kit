import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../config/ui_common_texts.dart';
import 'tilt_guard.dart';

const _maxRollDegrees = 10.0;

/// How a camera with a capture guide treats a phone rolled past 10°.
enum OrientationSensitivity {
  /// The shutter stays on; the guide only hints, and a tap or the shutter
  /// closes it until the phone has been level again.
  soft,

  /// The shutter is off and the guide ignores taps until the phone is level.
  hard;

  /// [value] by name, ignoring case and surrounding spaces; anything else,
  /// including null, is [hard].
  static OrientationSensitivity parse(String? value) =>
      values.asNameMap()[value?.trim().toLowerCase()] ?? hard;
}

/// Builds a camera screen with a capture [guide]: the overlay the user opens
/// with the Guide button (looping until a tap or the shutter closes it), also
/// shown while the phone is rolled more than 10° (see
/// [orientationSensitivity]); a tilt guide closes by itself once level.
/// Leaving the app closes it and releases the sensor. A null [guide] is the
/// plain camera: can always capture, no overlay, no Guide button, no sensor.
class CameraGuide extends StatefulWidget {
  const CameraGuide({
    required this.guide,
    required this.builder,
    this.orientationSensitivity = OrientationSensitivity.hard,
    this.events,
    super.key,
  });

  /// Fills the camera preview; draws its own scrim.
  final Widget? guide;

  /// [overlay] goes over the preview; the page calls [closeGuide] when the
  /// shutter is pressed. Both callbacks are null without a guide.
  final Widget Function(
    BuildContext context,
    bool canCapture,
    Widget? overlay,
    VoidCallback? openGuide,
    VoidCallback? closeGuide,
  ) builder;

  final OrientationSensitivity orientationSensitivity;

  /// Accelerometer readings; the device sensor when null.
  final Stream<AccelerometerEvent>? events;

  @override
  State<CameraGuide> createState() => _CameraGuideState();
}

class _CameraGuideState extends State<CameraGuide> with WidgetsBindingObserver {
  late final Stream<AccelerometerEvent> _events = widget.events ??
      accelerometerEventStream(samplingPeriod: SensorInterval.uiInterval);
  StreamSubscription<AccelerometerEvent>? _subscription;
  bool _isLevel = true;
  bool _requested = false;
  bool _tiltDismissed = false;

  bool get _blocksCapture =>
      widget.orientationSensitivity == OrientationSensitivity.hard;

  @override
  void initState() {
    super.initState();
    if (widget.guide != null) {
      WidgetsBinding.instance.addObserver(this);
      _listen();
    }
  }

  void _listen() {
    var level = true;
    _subscription ??= _events.listen(
      (e) {
        level = nextIsLevel(
          wasLevel: level,
          roll: rollDegrees(e.x, e.y, e.z),
          max: _maxRollDegrees,
        );
        _setLevel(level);
      },
      onError: (Object _) => _setLevel(true),
    );
  }

  // Only flips between level and tilted rebuild; readings in between do not.
  void _setLevel(bool level) {
    if (mounted && level != _isLevel) {
      setState(() {
        _isLevel = level;
        if (level) {
          _tiltDismissed = false;
        }
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _listen();
      return;
    }
    unawaited(_subscription?.cancel());
    _subscription = null;
    setState(() {
      _isLevel = true;
      _requested = false;
      _tiltDismissed = false;
    });
  }

  void _close() {
    if (!_isLevel && _blocksCapture) {
      return;
    }
    setState(() {
      _requested = false;
      _tiltDismissed = !_isLevel;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final guide = widget.guide;
    if (guide == null) {
      return widget.builder(context, true, null, null, null);
    }
    final showsTiltGuide = !_isLevel && (_blocksCapture || !_tiltDismissed);
    return widget.builder(
      context,
      _isLevel || !_blocksCapture,
      _requested || showsTiltGuide
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _close,
              child: SizedBox.expand(child: guide),
            )
          : null,
      () => setState(() => _requested = true),
      _close,
    );
  }
}

/// The "? Guide" pill for a camera app bar.
class CameraGuideButton extends StatelessWidget {
  const CameraGuideButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.help_outline, size: 20),
          label: Text(UiCommonTexts().kGuide, maxLines: 1),
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
}
