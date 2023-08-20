import 'package:aquayar/config/network/typedef.dart';

abstract class UserProvider {
  EitherAquayarAuthUser updateUser({
    required String name,
    required String gender,
  });
}
