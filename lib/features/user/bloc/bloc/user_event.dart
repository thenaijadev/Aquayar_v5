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

class UserEventUpdateCustomerLocation extends UserEvent {
  final String address;
  final String city;
  final double tankSize;
  UserEventUpdateCustomerLocation(
      {required this.address, required this.tankSize, required this.city});
}
