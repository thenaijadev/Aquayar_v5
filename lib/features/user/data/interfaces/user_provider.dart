import 'package:aquayar/config/network/typedef.dart';
import 'package:geolocator/geolocator.dart';

abstract class UserProvider {
  EitherAquayarAuthUser updateUser({
    required String name,
    required String gender,
  });

  Future<Position> getUserLocation();

  EitherAquayarAuthUser addLocation({
    required String address,
    required String city,
    required String countryCode,
    double? tankSize,
    required String phone,
  });

  EitherAquayarAuthUser requestOtp({
    required String phone,
  });
  EitherAquayarAuthUser checkOtp({
    required int otp,
  });

  EitherAquayarAuthUser getUser();
}
