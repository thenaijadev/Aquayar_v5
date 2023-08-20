import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 440,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.04),
              end: Alignment(-1, 0.04),
              colors: [Color(0xEFF3F4F7), Color(0xD1E0E5EF)],
            ),
            shape: OvalBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1.03,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x2D1F2442),
                blurRadius: 32,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
