import 'package:aquayar/features/auth/presentation/screens/landing_screen.dart';
import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/features/auth/presentation/screens/login_screen.dart';
import 'package:aquayar/features/auth/presentation/screens/registration_screen.dart';
import 'package:aquayar/features/user/presentation/screens/gender_screen.dart';
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
      // case Routes.profileDetails:
      //   var data = routeSettings.arguments as Map;
      //   return MaterialPageRoute(
      //     builder: (_) => ProfileDetailsScreen(data: data),
      //   );
      // case Routes.directionMap:
      //   return MaterialPageRoute(
      //     builder: (_) => const DirectionsMapScreen(),
      //   );

      // case Routes.chat:
      //   return MaterialPageRoute(
      //     builder: (_) => const ChatScreen(),
      //   );

      // case Routes.confirmDetails:
      //   var data = routeSettings.arguments as Map<String, dynamic>;

      //   return MaterialPageRoute(
      //     builder: (_) => ConfirmDetails(data: data),
      //   );
      // case Routes.helpAndSupport:
      //   return MaterialPageRoute(
      //     builder: (_) => const HelpAndSupport(),
      //   );

      // case Routes.deleteAccount:
      //   return MaterialPageRoute(
      //     builder: (_) => const DeleteAccount(),
      //   );
      // case Routes.helpSupportNoTicket:
      //   return MaterialPageRoute(
      //     builder: (_) => const HelpSupportTickets(),
      //   );
      // case Routes.waterTank:
      //   return MaterialPageRoute(
      //     builder: (_) => const WaterTankScreeen(),
      //   );

      // case Routes.phoneVerification:
      //   var data = routeSettings.arguments as List;
      //   return MaterialPageRoute(
      //     builder: (_) => PhoneVerificationScreen(data: data),
      //   );
      // case Routes.otp:
      //   var data = routeSettings.arguments as List;
      //   return MaterialPageRoute(
      //     builder: (_) => OtpScreen(data: data),
      //   );
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordScreen(),
      //   );
      // case Routes.emailSent:
      //   var data = routeSettings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (_) => OtpSent(
      //       data: data,
      //     ),
      //   );
      // case Routes.createNewPassword:
      //   var data = routeSettings.arguments as String;

      //   return MaterialPageRoute(
      //     builder: (_) => CreateNewPasswordScreen(token: data),
      //   );
      // case Routes.createNewPasswordSuccessful:
      //   return MaterialPageRoute(
      //     builder: (_) => const PasswordChangeSuccessfulScreen(),
      //   );

      // case Routes.registrationDone:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegistrationDoneScreen(),
      //   );

      // case Routes.home:
      //   var data = routeSettings.arguments as AquayarAuthUser;

      //   return MaterialPageRoute(
      //     builder: (_) => HomeScreenNoOrder(user: data),
      //   );
      // case Routes.orderWater:
      //   return MaterialPageRoute(
      //     builder: (_) => const OrderWater(),
      //   );
      // case Routes.waterAquired:
      //   return MaterialPageRoute(
      //     builder: (_) => const WaterAcquiredScreen(),
      //   );
      // case Routes.locations:
      //   return MaterialPageRoute(
      //     builder: (_) => const LocationsScreen(),
      //   );
      // case Routes.editLocation:
      //   var address = routeSettings.arguments as Address;

      //   return MaterialPageRoute(
      //     builder: (_) => EditLocation(address: address),
      //   );
      // case Routes.menu:
      //   var data = routeSettings.arguments as AquayarAuthUser;

      //   return MaterialPageRoute(
      //     builder: (_) => Menu(user: data),
      //   );
      // case Routes.renameLocation:
      //   var address = routeSettings.arguments as Address;

      //   return MaterialPageRoute(
      //     builder: (_) => RenameLocation(address: address),
      //   );

      // case Routes.changePassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePasswordScreen(),
      //   );
      // case Routes.editProfile:
      //   var data = routeSettings.arguments as AquayarAuthUser;

      //   return MaterialPageRoute(
      //     builder: (_) => EditProfile(user: data),
      //   );

      // // case Routes.payNowScreen:
      // //   var data = routeSettings.arguments as CardModel;
      // //   return MaterialPageRoute(
      // //     builder: (_) => PayNowScreen(card: data),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text("Error"),
          ),
        );
    }
  }
}
