import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateIsLoading extends AuthState {}

class AuthStateError extends AuthState {
  final String message;
  AuthStateError({
    required this.message,
  });
}

class AuthStateLoggedIn extends AuthState {
  final AquayarAuthUser user;
  AuthStateLoggedIn({
    required this.user,
  });
}

class AuthStateRegistered extends AuthState {
  final AquayarAuthUser user;
  AuthStateRegistered({
    required this.user,
  });
  @override
  List<Object?> get props => [user];

  AquayarAuthUser get getUser => user;
}

class AuthStateLocationUpdated extends AuthState {}

class AuthStatePasswordResetRequestSent extends AuthState {}

class AuthStatePasswordChangeOtpSent extends AuthState {
  final String resetToken;
  AuthStatePasswordChangeOtpSent({required this.resetToken});
}

class AuthStatePasswordChanged extends AuthState {}
