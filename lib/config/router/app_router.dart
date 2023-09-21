import 'package:aquayar/config/exports/exports.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.payment:
        var id = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => PaymentScreen(id: id),
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
          builder: (_) => CreateNewPasswordScreen(
            resetToken: data,
          ),
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

      case Routes.orderCancellingLoading:
        return MaterialPageRoute(
          builder: (_) => const OrderCancelLoading(),
        );
      case Routes.webview:
        var url = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => PaymentWebView(
            url: url,
          ),
        );
      case Routes.createNewPasswordSuccessful:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangeSuccessfulScreen(),
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
