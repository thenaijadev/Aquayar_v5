import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/user/data/interfaces/user_provider.dart';

class UserRepository {
  final UserProvider provider;
  UserRepository({required this.provider});

  EitherAquayarAuthUser updateUser({
    required String name,
    required String gender,
  }) {
    return provider.updateUser(name: name, gender: gender);
  }

  EitherAquayarAuthUser addLocation({
    required String address,
    required String city,
    double? tankSize,
    required String countryCode,
    required String phone,
  }) {
    return provider.addLocation(
        countryCode: countryCode,
        phone: phone,
        address: address,
        city: city,
        tankSize: tankSize);
  }

  EitherAquayarAuthUser requestOtp({
    required String phone,
  }) {
    return provider.requestOtp(
      phone: phone,
    );
  }

  EitherAquayarAuthUser checkOtp({
    required int otp,
  }) {
    return provider.checkOtp(
      otp: otp,
    );
  }

  EitherAquayarAuthUser getUser() {
    return provider.getUser();
  }
}
