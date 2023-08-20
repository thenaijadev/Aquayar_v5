part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventUpdateGenderAndName extends UserEvent {
  final String name;
  final String gender;
  const UserEventUpdateGenderAndName({
    required this.name,
    required this.gender,
  });
}
