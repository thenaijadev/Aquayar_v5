import 'package:aquayar/features/auth/presentation/screens/change_password_screen_from_menu.dart';
import 'package:aquayar/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/forgot_password_otp_sent.dart';
import 'package:aquayar/features/auth/presentation/screens/landing_screen.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/features/auth/presentation/screens/login_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/registration_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/reset_password.dart';
import 'package:aquayar/features/chat/presentation/screens/chat_screen.dart';
import 'package:aquayar/features/delete_account/presentation/screens/delete_account.dart';
import 'package:aquayar/features/help&Support/presentation/screens/help_and_support.dart';
import 'package:aquayar/features/help&Support/presentation/screens/help_and_support_no_tickets.dart';
import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/locations/presentation/screens/edit_location_screen.dart';
import 'package:aquayar/features/orders/presentation/screens/confirm_details.dart';
import 'package:aquayar/features/orders/presentation/screens/home.dart';
import 'package:aquayar/features/locations/presentation/screens/locations.dart';
import 'package:aquayar/features/orders/presentation/screens/menu.dart';
import 'package:aquayar/features/orders/presentation/screens/order_water.dart';
import 'package:aquayar/features/locations/presentation/screens/rename_location.dart';
import 'package:aquayar/features/user/presentation/screens/edit_profile_screen.dart';
import 'package:aquayar/features/user/presentation/screens/gender_screen.dart';
import 'package:aquayar/features/user/presentation/screens/otp_screen.dart';
import 'package:aquayar/features/user/presentation/screens/phone_verification_screen.dart';
import 'package:aquayar/features/user/presentation/screens/profile_details.dart';
import 'package:aquayar/features/user/presentation/screens/registration_done_screen.dart';
import 'package:aquayar/features/user/presentation/screens/user_water_tank_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
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
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.menu:
        return MaterialPageRoute(
          builder: (_) => const Menu(),
        );

      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfile(),
        );

      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      case Routes.waterTank:
        return MaterialPageRoute(
          builder: (_) => const WaterTankScreeen(),
        );

      case Routes.orderWater:
        return MaterialPageRoute(
          builder: (_) => const OrderWater(),
        );
      case Routes.locations:
        return MaterialPageRoute(
          builder: (_) => const LocationsScreen(),
        );

      case Routes.editLocation:
        var address = routeSettings.arguments as Address;

        return MaterialPageRoute(
          builder: (_) => EditLocation(address: address),
        );

      case Routes.renameLocation:
        var address = routeSettings.arguments as Address;

        return MaterialPageRoute(
          builder: (_) => RenameLocation(address: address),
        );

      case Routes.helpAndSupport:
        return MaterialPageRoute(
          builder: (_) => const HelpAndSupport(),
        );

      case Routes.deleteAccount:
        return MaterialPageRoute(
          builder: (_) => const DeleteAccount(),
        );

      case Routes.helpSupportNoTicket:
        return MaterialPageRoute(
          builder: (_) => const HelpSupportTickets(),
        );

      case Routes.confirmDetails:
        var data = routeSettings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => ConfirmDetails(data: data),
        );

      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
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
