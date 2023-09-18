import 'package:flutter/material.dart';
import 'dart:math' as math;

class WavePainter extends CustomPainter {
  final double animationValue;
  final Color waveColor;
  final double waveHeight;
  final double waveAmplitude;
  final double waveFrequency;

  WavePainter({
    required this.animationValue,
    required this.waveColor,
    required this.waveHeight,
    required this.waveAmplitude,
    required this.waveFrequency,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = waveColor;

    final wavePath = Path();
    final waveWidth = size.width;

    wavePath.moveTo(0, size.height);

    for (double i = 0; i <= waveWidth; i++) {
      final x = i;
      final y = math.sin((i / waveWidth * 1 * math.pi) +
                  (animationValue * 2 * math.pi * waveFrequency)) *
              waveAmplitude +
          size.height * (1 - waveHeight);
      wavePath.lineTo(x, y);
    }

    wavePath.lineTo(size.width, size.height);
    wavePath.close();

    canvas.drawPath(wavePath, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return animationValue != oldDelegate.animationValue ||
        waveColor != oldDelegate.waveColor ||
        waveHeight != oldDelegate.waveHeight ||
        waveAmplitude != oldDelegate.waveAmplitude ||
        waveFrequency != oldDelegate.waveFrequency;
  }
}
