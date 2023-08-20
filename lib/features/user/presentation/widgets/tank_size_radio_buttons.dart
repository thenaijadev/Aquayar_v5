import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TankSizeRadioBtn extends StatefulWidget {
  const TankSizeRadioBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.choice});
  final String label;
  final void Function() onPressed;
  final String? choice;
  @override
  State<TankSizeRadioBtn> createState() => _TankSizeRadioBtnState();
}

class _TankSizeRadioBtnState extends State<TankSizeRadioBtn> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: const Color(0xff61C7F9),
            width: widget.choice == widget.label ? 1 : 0,
          ),
        ),
        child: widget.choice == widget.label
            ? Row(
                children: [
                  GradientText("✓",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                      colors: const [
                        Color(0xff61C7F9),
                        Color(0xff0579CE),
                      ]),
                  const SizedBox(
                    width: 5,
                  ),
                  GradientText(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    colors: const [
                      Color(0xff61C7F9),
                      Color(0xff0579CE),
                    ],
                  ),
                ],
              )
            : TextWidget(
                text: widget.label,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 149, 159, 193),
              ));
  }
}

final List<String> tankSizes = [
  "200",
  "500",
  "750",
  "1000",
  "1200",
  "1500",
  "2000",
  "2500",
];
