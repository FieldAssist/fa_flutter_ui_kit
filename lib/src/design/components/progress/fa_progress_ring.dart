import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_status_ramp.dart';

class FaProgressRing extends StatelessWidget {
  const FaProgressRing({
    required this.value,
    this.label,
    this.tone = FaTone.success,
    this.size = 56,
    this.strokeWidth = 7,
    super.key,
  });

  final double value;
  final Widget? label;
  final FaTone tone;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final status = context.faColors.status;
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _RingPainter(
          value: value.clamp(0.0, 1.0),
          strokeWidth: strokeWidth,
          track: status.neutral.border,
          arc: status.of(tone).solid,
        ),
        child: label == null ? null : Center(child: label),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.value,
    required this.strokeWidth,
    required this.track,
    required this.arc,
  });

  final double value;
  final double strokeWidth;
  final Color track;
  final Color arc;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    canvas.drawCircle(
      rect.center,
      rect.width / 2,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = track,
    );
    if (value > 0) {
      canvas.drawArc(
        rect,
        -math.pi / 2,
        math.pi * 2 * value,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = arc,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.value != value ||
      old.strokeWidth != strokeWidth ||
      old.track != track ||
      old.arc != arc;
}
