import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: TextWidget(
              text: "Welcome to Aquayar 👋🏿",
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 40),
          child: TextWidget(
            fontSize: 15,
            text: "Aquayar brings you closer to better water services",
            color: Color(0xff868FAE),
          ),
        ),
      ],
    );
  }
}
