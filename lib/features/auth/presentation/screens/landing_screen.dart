import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/call_to_action.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/logo_stack.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/welcome_text_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    final UserBloc userBloc = context.read<UserBloc>();
    userBloc.add(UserEventGetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserStateUserGotten) {
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state is UserStateIsLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 70,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: LoadingWidget(),
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      LogoStack(),
                      WelcomeTextWidget(),
                      CallToAction()
                    ],
                  );
          },
        ),
      ),
    );
  }
}
