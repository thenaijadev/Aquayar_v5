import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/dio_exception.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/auth/data/interfaces/auth_provider.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/auth/data/providers/super_base_auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthProviderImpl implements AuthProvider {
  @override
  EitherAquayarAuthUser signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignUp,
          data: {"email": email, "password": password, "type": "customer"});

      return right(AquayarAuthUser.fromJson(
          {...response, "email": email, "displayName": "", "photoUrl": ""}));
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherAquayarAuthUser logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignIn,
          data: {"email": email, "password": password, "type": "customer"});

      return right(AquayarAuthUser.fromJson(
          {...response, "email": email, "displayName": "", "photoUrl": ""}));
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap forgotPassord({required String email}) async {
    try {
      final response =
          await DioClient.instance.post(RoutesAndPaths.forgotPassword, data: {
        "email": email,
      });

      return right(response);
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap checkOTP({
    required String otp,
  }) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.verifyOtpToChangePassword,
        data: {
          "otp": otp,
        },
      );

      return right(response);
    } on DioException {
      return left("The code has either expired or is invalid");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap changePassword({
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

      final response = await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"password": password, "passwordConfirmation": confirmPassword},
        options: Options(
          headers: {"Authorization": "Bearer ${user.authToken}"},
        ),
      );
      return right(response);
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  EitherAquayarAuthUser signInWithGoogle() async {
    try {
      final googleUser = await SuperBaseAuthProvider().signUpWithGoogle();

      final response = await googleUser.fold((l) => null, (r) async {
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignIn, data: {
          "profileId": r.id,
        });
        return AquayarAuthUser.fromJson(
            {...response, "email": r.email, "displayName": '', "photoUrl": ""});
      });

      return right(response!);
    } on DioException catch (e) {
      return left(e.response?.data.to);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherAquayarAuthUser signUpWithGoogle() async {
    try {
      final googleUser = await SuperBaseAuthProvider().signUpWithGoogle();

      final response = await googleUser.fold((l) => null, (r) async {
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignUp, data: {
          "profileId": r.id,
          "email": r.email,
          "displayName": "anonymous"
        });
        return AquayarAuthUser.fromJson(
            {...response, "email": r.email, "displayName": '', "photoUrl": ""});
      });

      return right(response!);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
