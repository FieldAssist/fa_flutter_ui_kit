import 'dart:math';

import 'package:flutter/material.dart';

class GaugeRange {
  final double startValue;
  final double endValue;
  final Color color;

  GaugeRange({
    required this.startValue,
    required this.endValue,
    required this.color,
  });
}

class CustomGaugePainter extends CustomPainter {
  CustomGaugePainter({
    required this.currentValue,
    required this.targetValue,
    required this.gaugeRanges,
    required this.backgroundColor,
  });

  final double currentValue;
  final double targetValue;
  final List<GaugeRange> gaugeRanges;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    final center = Offset(size.width / 2, size.height);

    // Draw background arc
    paint.color = backgroundColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      pi,
      pi,
      false,
      paint,
    );

    // Draw gauge ranges
    for (var range in gaugeRanges) {
      paint.color = range.color;
      final startAngle = (pi * range.startValue) / targetValue;
      final sweepAngle = (pi * (range.endValue - range.startValue)) / targetValue;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: 100),
        pi + startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    // Draw current value arc
    paint.color = Colors.black;
    final currentSweepAngle = (pi * (currentValue < targetValue ? currentValue : targetValue)) / targetValue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      pi,
      currentSweepAngle,
      false,
      paint,
    );

    // Draw labels
    final startLabelPainter = TextPainter(
      text: TextSpan(
        text: '0',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    startLabelPainter
      ..layout()
      ..paint(canvas, Offset(center.dx - 110, size.height + 10));

    final targetLabelPainter = TextPainter(
      text: TextSpan(
        text: targetValue.toString(),
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    targetLabelPainter.layout();
    targetLabelPainter.paint(canvas, Offset(center.dx + 80, size.height + 10));

    final currentValueText = currentValue.toStringAsFixed(1);
    final currentValuePainter = TextPainter(
      text: TextSpan(
        text: currentValueText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    currentValuePainter.layout();
    currentValuePainter.paint(
      canvas,
      Offset(center.dx - currentValuePainter.width / 2,
          center.dy - currentValuePainter.height / 2 - 35),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
