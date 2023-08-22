import 'dart:math';

import 'package:flutter/material.dart';

class RoundedProgressPainter extends CustomPainter {
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;
  final double value;

  RoundedProgressPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.strokeWidth,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final valuePaint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * value;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      valuePaint,
    );
  }

  @override
  bool shouldRepaint(RoundedProgressPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
