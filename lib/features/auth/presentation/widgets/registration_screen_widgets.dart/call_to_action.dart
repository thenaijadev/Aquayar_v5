import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/outlined_button_no_icon.dart';
import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: Image.asset(
                    "assets/images/line.png",
                    width: 150,
                  ),
                ),
              ),
              const TextWidget(
                text: "   or   ",
                color: AppColors.titleBlack,
              ),
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: Image.asset(
                    "assets/images/line.png",
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 35.0, bottom: 20, left: 16, right: 16),
          child: GestureDetector(
              onTap: () {
                // authBloc.add(const AuthEventSignUpWithGoogle());
              },
              child: Image.asset("assets/images/google_signup.png")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: GestureDetector(
              child: Image.asset("assets/images/apple_signup.png")),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: TextWidget(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                text: "Already have an account?",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            OutlinedButtonWidgetNoIcon(
                width: 80,
                height: 40,
                label: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                })
          ],
        ),
      ],
    );
  }
}
