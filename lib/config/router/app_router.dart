import 'package:aquayar/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/forgot_password_otp_sent.dart';
import 'package:aquayar/features/auth/presentation/screens/landing_screen.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/features/auth/presentation/screens/login_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/registration_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/reset_password.dart';
import 'package:aquayar/features/user/presentation/screens/gender_screen.dart';
import 'package:aquayar/features/user/presentation/screens/otp_screen.dart';
import 'package:aquayar/features/user/presentation/screens/phone_verification_screen.dart';
import 'package:aquayar/features/user/presentation/screens/profile_details.dart';
import 'package:aquayar/features/user/presentation/screens/registration_done_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );

      case Routes.gender:
        return MaterialPageRoute(
          builder: (_) => const GenderScreen(),
        );
      case Routes.profileDetails:
        return MaterialPageRoute(
          builder: (_) => const ProfileDetailsScreen(),
        );

      case Routes.phoneVerification:
        var data = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => PhoneVerificationScreen(data: data),
        );

      case Routes.otp:
        var data = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(data: data),
        );

      case Routes.registrationDone:
        return MaterialPageRoute(
          builder: (_) => const RegistrationDoneScreen(),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case Routes.emailSent:
        var data = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordOtpSent(
            data: data,
          ),
        );

      case Routes.createNewPassword:
        var data = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(token: data),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text("Error"),
          ),
        );
    }
  }
}
