import 'package:flutter/material.dart';

class HorizontalLineWidget extends StatelessWidget {
  const HorizontalLineWidget({super.key, this.width = 396});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      decoration: const BoxDecoration(color: Color(0xFFD6E0E9)),
    );
  }
}
