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
      ..strokeWidth = 20;

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

    // Draw ticks
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    for (int i = 0; i <= 10; i++) {
      final angle = pi * i / 10;
      final x1 = center.dx + 90 * cos(pi + angle);
      final y1 = center.dy + 90 * sin(pi + angle);
      final x2 = center.dx + 100 * cos(pi + angle);
      final y2 = center.dy + 100 * sin(pi + angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    // Draw current value arc
    paint.color = Colors.black;
    paint.strokeWidth = 20;
    final currentSweepAngle = (pi * (currentValue < targetValue ? currentValue : targetValue)) / targetValue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      pi,
      currentSweepAngle,
      false,
      paint,
    );

    // Draw circular indicator
    final indicatorAngle = pi + currentSweepAngle;
    final indicatorX = center.dx + 100 * cos(indicatorAngle);
    final indicatorY = center.dy + 100 * sin(indicatorAngle);
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(indicatorX, indicatorY), 10, paint);
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(indicatorX, indicatorY), 10, paint);

    // Draw labels
    final startLabelPainter = TextPainter(
      text: TextSpan(
        text: '00 pcs',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    startLabelPainter
      ..layout()
      ..paint(canvas, Offset(center.dx - 140, size.height + 10));

    final targetLabelPainter = TextPainter(
      text: TextSpan(
        text: '${targetValue.toInt()} pcs',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    targetLabelPainter.layout();
    targetLabelPainter.paint(canvas, Offset(center.dx + 100, size.height + 10));

    final currentValueText = currentValue.toStringAsFixed(1);
    final currentValuePainter = TextPainter(
      text: TextSpan(
        text: '$currentValueText pcs',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    currentValuePainter.layout();
    currentValuePainter.paint(
      canvas,
      Offset(center.dx - currentValuePainter.width / 2,
          center.dy - currentValuePainter.height / 2 - 60),
    );

    // Draw percentage
    final percentage = (currentValue / targetValue * 100).toStringAsFixed(1) + ' %';
    final percentagePainter = TextPainter(
      text: TextSpan(
        text: percentage,
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    percentagePainter.layout();
    percentagePainter.paint(
      canvas,
      Offset(center.dx - percentagePainter.width / 2,
          center.dy - percentagePainter.height / 2 - 90),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomGauge extends StatelessWidget {
  final double currentValue;
  final double targetValue;

  CustomGauge({
    required this.currentValue,
    required this.targetValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 150),
      painter: CustomGaugePainter(
        currentValue: currentValue,
        targetValue: targetValue,
        gaugeRanges: [
          GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
          GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
          GaugeRange(startValue: 100, endValue: 150, color: Colors.yellow),
          GaugeRange(startValue: 150, endValue: 200, color: Colors.green),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Gauge Example')),
        body: Center(
          child: CustomGauge(
            currentValue: 83.7,
            targetValue: 100,
          ),
        ),
      ),
    );
  }
}
