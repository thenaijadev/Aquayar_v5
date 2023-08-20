import 'package:flutter/material.dart';

class OutlinedBtn extends StatelessWidget {
  const OutlinedBtn(
      {super.key,
      required this.onPressed,
      required this.label,
      this.width = 140});
  final void Function() onPressed;
  final Widget label;
  final double width;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(width: 3, color: Colors.black),
            ),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: width, vertical: 14),
          ),
        ),
        label: label,
        icon: const Text(""),
        onPressed: onPressed);
  }
}
