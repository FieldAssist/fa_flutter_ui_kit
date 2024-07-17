import 'dart:math';

import 'package:flutter/material.dart';

class CustomGaugePainter extends CustomPainter {
  CustomGaugePainter({
    required this.currentValue,
    required this.targetValue,
    required this.backgroundColor,
  });

  final double currentValue;
  final double targetValue;
  final Color backgroundColor;

  Color getGaugeColor(double value, double target) {
    final percentage = (value / target) * 100;
    if (percentage <= 25) {
      return Colors.red;
    } else if (percentage <= 50) {
      return Colors.orange;
    } else if (percentage <= 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

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

    paint.color = getGaugeColor(currentValue, targetValue);
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
