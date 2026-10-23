import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../config/ui_common_texts.dart';
import 'tilt_guard.dart';

/// A capture guide for a camera screen: an overlay [guide] shown on request,
/// on open when [showOnOpen], and forced while the phone is rolled past
/// [maxRollDegrees].
class CameraGuideConfig {
  const CameraGuideConfig({
    required this.maxRollDegrees,
    required this.guide,
    this.showOnOpen = false,
  });

  final double maxRollDegrees;

  /// Fills the camera preview; draws its own scrim.
  final Widget guide;
  final bool showOnOpen;
}

class CameraGuideState {
  const CameraGuideState({
    required this.isLevel,
    required this.overlay,
    required this.openGuide,
  });

  /// False while tilted; the shutter should be disabled.
  final bool isLevel;

  /// The guide to stack over the preview, or null when hidden.
  final Widget? overlay;

  /// Shows the guide until the user taps it away.
  final VoidCallback openGuide;
}

/// Builds the camera screen with the guide's current [CameraGuideState]. A
/// guide the user opened (or [CameraGuideConfig.showOnOpen]) is dismissed by
/// a tap; one forced by a tilt ignores taps and hides once the phone is level.
class CameraGuide extends StatefulWidget {
  const CameraGuide({
    required this.config,
    required this.builder,
    this.events,
    super.key,
  });

  final CameraGuideConfig config;
  final Widget Function(BuildContext context, CameraGuideState state) builder;

  /// Accelerometer readings; the device sensor when null.
  final Stream<AccelerometerEvent>? events;

  @override
  State<CameraGuide> createState() => _CameraGuideState();
}

class _CameraGuideState extends State<CameraGuide> {
  late bool _requested = widget.config.showOnOpen;

  @override
  Widget build(BuildContext context) => TiltGuard(
        maxRollDegrees: widget.config.maxRollDegrees,
        events: widget.events,
        builder: (context, isLevel) => widget.builder(
          context,
          CameraGuideState(
            isLevel: isLevel,
            overlay: _requested || !isLevel
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: isLevel
                        ? () => setState(() => _requested = false)
                        : null,
                    child: SizedBox.expand(child: widget.config.guide),
                  )
                : null,
            openGuide: () => setState(() => _requested = true),
          ),
        ),
      );
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
