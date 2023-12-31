part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserStateError extends UserState {
  final String error;
  const UserStateError({required this.error});
  @override
  List<Object> get props => [];
}

class UserStateNameAndGenderUpdated extends UserState {
  final AquayarAuthUser user;
  const UserStateNameAndGenderUpdated({required this.user});
  @override
  List<Object> get props => [user];
}

class UserStateIsLoading extends UserState {}

class UserStateLocationUpdated extends UserState {
  final AquayarAuthUser user;
  const UserStateLocationUpdated({required this.user});
  @override
  List<Object> get props => [user];
}

class UserStateRequestOtp extends UserState {}

class UserStateOtpRequestSent extends UserState {
  final AquayarAuthUser user;
  const UserStateOtpRequestSent({required this.user});
  @override
  List<Object> get props => [user];
}

class UserStateOtpChecked extends UserState {
  final AquayarAuthUser user;
  const UserStateOtpChecked({required this.user});
  @override
  List<Object> get props => [user];
}

class UserStateUserGotten extends UserState {
  final AquayarAuthUser user;
  const UserStateUserGotten({required this.user});
  @override
  List<Object> get props => [user];
}
