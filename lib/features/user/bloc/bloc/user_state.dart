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
