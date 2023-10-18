import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final locator = GetIt.instance;
void setUp() {
  locator.registerLazySingleton<Box<AquayarAuthUser>>(
      () => Hive.box<AquayarAuthUser>("aquayarAuthUser"));
}
