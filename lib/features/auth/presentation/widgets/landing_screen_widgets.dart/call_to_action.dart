import 'package:aquayar/core/widgets/outlined_button.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.registration);
            },
            child: Image.asset("assets/images/button.png")),
        OutlinedBtn(
          width: MediaQuery.of(context).size.width * .4,
          label: const TextWidget(
            text: "Login",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          onPressed: () async {
            Navigator.pushNamed(context, Routes.login);
          },
        ),
      ],
    );
  }
}
