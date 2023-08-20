import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.label,
      this.hintColor = AppColors.hintColor,
      this.initialValue,
      required this.hintText,
      this.hintSize = 14,
      required this.onChanged,
      this.validator,
      required this.textFieldkey,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixicon,
      this.padding = const EdgeInsets.only(bottom: 10),
      this.onTap,
      this.maxLines = 1,
      this.fontWeight = FontWeight.w600,
      this.labelFontSize = 16,
      this.enabledBorderRadius = 30,
      this.verticalContentPadding = 0,
      this.controller});
  final String label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final String? initialValue;
  final EdgeInsetsGeometry padding;
  final int? maxLines;
  final double enabledBorderRadius;
  final double verticalContentPadding;
  final FontWeight fontWeight;
  final Color hintColor;
  final double labelFontSize;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: padding,
            child: TextWidget(
              text: label,
              fontWeight: fontWeight,
              fontSize: labelFontSize,
            ),
          ),
          TextFormField(
            controller: controller,
            onTap: onTap,
            key: textFieldkey,
            initialValue: initialValue,
            onChanged: onChanged,
            maxLines: maxLines,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixicon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: hintSize,
                  fontFamily: 'Neue Plak'),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 24, vertical: verticalContentPadding),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.textGrey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.inputBorder, width: 1),
                borderRadius: BorderRadius.circular(enabledBorderRadius),
              ),
              hintText: hintText,
            ),
          ),
        ]),
      ),
    );
  }
}
