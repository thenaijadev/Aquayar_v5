import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: const SingleChildScrollView(child: LoginForm()),
    );
  }
}
