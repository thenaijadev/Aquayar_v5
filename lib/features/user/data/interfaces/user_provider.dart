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
    double? tankSize,
  });
}
