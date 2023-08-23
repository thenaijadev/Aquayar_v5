import 'package:flutter/material.dart';

class BlueArrowMouseIcon extends StatelessWidget {
  const BlueArrowMouseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.75, -0.67),
          end: Alignment(-0.75, 0.67),
          colors: [Color(0xFF60C6F9), Color(0xFF0479CD)],
        ),
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 14,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset("assets/images/mouse.png"),
    );
  }
}
