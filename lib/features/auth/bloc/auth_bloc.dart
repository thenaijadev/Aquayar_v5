// ignore_for_file: unused_local_variable

import 'package:aquayar/config/network/dio_exception.dart';
import 'package:aquayar/features/auth/bloc/auth_event.dart';
import 'package:aquayar/features/auth/bloc/auth_state.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/auth/data/repos/auth_repo.dart';
import 'package:dio/dio.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc(
    AuthRepo authRepo,
  ) : super(AuthStateInitial()) {
    on<AuthEventRegister>((event, emit) async {
      emit(AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;

      final user = await authRepo.signUp(email: email, password: password);

      await user.fold((l) {
        emit(AuthStateError(message: l));
      }, (r) async {
        final box = AquayarBox.getAquayarUser();
        await box.clear();
        box.add(r);
        emit(AuthStateRegistered(user: r));
      });
    });

    on<AuthEventSignUpWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final user = await authRepo.signUpWithGoogle();

        await user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          final box = AquayarBox.getAquayarUser();
          await box.clear();
          box.add(r);

          emit(AuthStateRegistered(user: r));
        });
      },
    );

    on<AuthEventSignInWithGoogle>(
      (event, emit) async {
        emit(GoogleAuthStateIsLoading());

        final user = await authRepo.signInWithGoogle();

        await user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          final box = AquayarBox.getAquayarUser();
          await box.clear();
          box.add(r);
          emit(AuthStateLoggedIn(user: r));
        });
      },
    );

    on<AuthEventLogIn>(
      (event, emit) async {
        emit(GoogleAuthStateIsLoading());

        final String email = event.email;
        final String password = event.password;

        final user = await authRepo.logIn(email: email, password: password);

        await user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          final box = AquayarBox.getAquayarUser();
          await box.clear();
          box.add(r);
          emit(AuthStateLoggedIn(user: r));
        });
      },
    );

    on<AuthEventCheckOtpForPasswordChange>(
      (event, emit) async {
        emit(AuthStateIsLoading());
        String otp = event.otp;

        final response = await authRepo.checkOTP(otp: otp);

        response.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          emit(AuthStatePasswordChangeOtpSent(
              resetToken: r["data"]["resetToken"]));
        });
      },
    );

    on<AuthEventChangePassword>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        String password = event.password;
        String confirmPassword = event.confirmPassword;

        final response = await authRepo.changePassword(
          password: password,
          confirmPassword: confirmPassword,
        );

        response.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) {
          emit(AuthStatePasswordChanged());
        });
      },
    );

    on<AuthEventForgotPassword>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final String email = event.email;

        try {
          final user = await authRepo.forgotPassword(
            email: email,
          );
          emit(AuthStatePasswordResetRequestSent());
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthStateLoggedIn(user: AquayarAuthUser.fromMap(json));
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthStateLoggedIn) {
      return state.user.toMap();
    }
    return null;
  }
}
