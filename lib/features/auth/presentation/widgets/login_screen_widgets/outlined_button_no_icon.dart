import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidgetNoIcon extends StatelessWidget {
  const OutlinedButtonWidgetNoIcon(
      {super.key,
      required this.label,
      required this.onPressed,
      this.height = 50,
      this.width = 350});

  final String label;
  final void Function() onPressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.inputBorder,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            height: height - 2,
            width: width - 2,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: TextWidget(
              text: label,
              color: const Color.fromARGB(255, 33, 37, 81),
              fontWeight: FontWeight.w400,
            )),
          )
        ],
      ),
    );
  }
}
