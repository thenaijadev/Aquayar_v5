import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:flutter/material.dart';

class BlueBtn extends StatelessWidget {
  const BlueBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      this.paddingHorizontal = 15,
      this.paddingVertical = 15,
      this.width,
      this.enabled = true,
      this.inversedLength = 25});
  final Widget label;
  final void Function() onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double? width;
  final bool enabled;
  final double inversedLength;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: inversedLength, vertical: 20),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: enabled ? 5 : 0,
          shadowColor: const Color(0xff61C7F9),
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical, horizontal: paddingHorizontal),
            decoration: enabled
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment(0.75, -0.67),
                      end: Alignment(-0.75, 0.67),
                      colors: [Color(0xFF60C6F9), Color(0xFF0479CD)],
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.disabledBtn),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                ),
                label,
                const Flexible(
                  child: SizedBox(
                    width: 160,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: enabled ? AppColors.white : AppColors.inputBorder,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
