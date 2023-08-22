import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget(
      {super.key,
      required this.image,
      required this.label,
      required this.onTap});

  final String image;
  final String label;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image),
                const SizedBox(
                  width: 12,
                ),
                TextWidget(
                  text: label,
                  color: const Color(0xFF868FAD),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Image.asset("assets/images/chevron_right.png"),
          ],
        ),
      ),
    );
  }
}
