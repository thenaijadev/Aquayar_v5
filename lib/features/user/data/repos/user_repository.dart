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
}
