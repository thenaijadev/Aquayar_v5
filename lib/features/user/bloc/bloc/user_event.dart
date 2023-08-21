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
  final double? tankSize;
  final String phone;
  final String countryCode;
  const UserEventUpdateCustomerLocation({
    required this.address,
    this.tankSize,
    required this.city,
    required this.phone,
    required this.countryCode,
  });
}

class UserEventGetOtp extends UserEvent {
  final String phone;

  const UserEventGetOtp({
    required this.phone,
  });
}

class UserEventCheckOtp extends UserEvent {
  final int otp;
  const UserEventCheckOtp({required this.otp});
}
