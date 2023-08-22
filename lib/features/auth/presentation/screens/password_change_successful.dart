import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';

import 'package:flutter/material.dart';

class PasswordChangeSuccessfulScreen extends StatefulWidget {
  const PasswordChangeSuccessfulScreen({super.key});

  @override
  State<PasswordChangeSuccessfulScreen> createState() =>
      _PasswordChangeSuccessfulScreenState();
}

class _PasswordChangeSuccessfulScreenState
    extends State<PasswordChangeSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset("assets/images/safe.png"),
            ),
            const TextWidget(
              text: "Password set successfully!",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.titleBlack,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextWidget(
                textAlign: TextAlign.center,
                fontSize: 15,
                text:
                    "We have sent a password recover instructions to your email.",
                color: Color(0xff868FAE),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.login),
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  child: Image.asset("assets/images/login_blue.png")),
            )
          ],
        ),
      ),
    );
  }
}
