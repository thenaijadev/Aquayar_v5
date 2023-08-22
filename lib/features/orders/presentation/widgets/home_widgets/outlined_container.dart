import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';

import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer(
      {super.key,
      this.color,
      this.borderRadius = 10,
      this.padding = const EdgeInsets.all(20),
      this.child = const TextWidget(text: "hi"),
      this.onTap,
      this.borderColor = AppColors.inputBorder,
      this.width,
      this.boxShadow});
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final void Function()? onTap;
  final Color? color;
  final double? width;
  final Color borderColor;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
