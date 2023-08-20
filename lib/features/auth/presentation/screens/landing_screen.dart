import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/call_to_action.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/logo_stack.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [LogoStack(), WelcomeTextWidget(), CallToAction()],
      ),
    );
  }
}
