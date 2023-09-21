import 'package:aquayar/config/network/typedef.dart';

abstract class AuthProvider {
  EitherAquayarAuthUser logIn({
    required String email,
    required String password,
  });
  EitherAquayarAuthUser signUp({
    required String email,
    required String password,
  });
  Future<void> logOut();

  EitherMap forgotPassord({required String email});
  EitherMap changePassword({
    required String password,
    required String resetToken,
    required String confirmPassword,
  });

  EitherAquayarAuthUser signUpWithGoogle();

  EitherAquayarAuthUser signInWithGoogle();
  EitherMap checkOTP({
    required String otp,
  });
}
