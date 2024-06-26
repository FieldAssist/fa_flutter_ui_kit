import 'dart:math';

import 'package:flutter/material.dart';

class CustomGaugePainter extends CustomPainter {
  CustomGaugePainter({
    required this.currentValue,
    required this.targetValue,
    required this.gaugeColor,
    required this.backgroundColor,
  });

  final double currentValue;
  final double targetValue;
  final Color gaugeColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    final center = Offset(size.width / 2, size.height);

    paint.color = backgroundColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      pi,
      pi,
      false,
      paint,
    );

    paint.color = gaugeColor;
    final sweepAngle =
        (pi * (targetValue < currentValue ? targetValue : currentValue)) /
            targetValue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      pi,
      sweepAngle,
      false,
      paint,
    );

    final startLabelPainter = TextPainter(
      text: TextSpan(
          text: '0', style: TextStyle(color: Colors.black, fontSize: 16)),
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
