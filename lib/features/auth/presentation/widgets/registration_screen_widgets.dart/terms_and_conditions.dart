import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          style: TextStyle(fontSize: 12), //apply style to all
          children: [
            TextSpan(
              text: 'By continuing , you agree to our',
              style: TextStyle(color: AppColors.richText),
            ),
            TextSpan(
              text: ' Terms of Use ',
              style: TextStyle(color: Color(0xff61C7F9)),
            ),
            TextSpan(
              text: 'and confirm that you have read our ',
              style: TextStyle(color: AppColors.richText),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Color(0xff0579CE)),
            )
          ],
        ),
      ),
    );
  }
}
