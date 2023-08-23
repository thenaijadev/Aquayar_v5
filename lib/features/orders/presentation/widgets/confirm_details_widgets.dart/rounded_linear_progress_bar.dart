import 'package:flutter/material.dart';

class RoundedProgressBar extends StatelessWidget {
  final double progress;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const RoundedProgressBar({
    super.key,
    this.progress = 0.0,
    this.height = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD6E0E9), width: .5),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
