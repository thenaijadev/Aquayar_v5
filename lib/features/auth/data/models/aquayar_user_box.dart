import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AquayarBox {
  static Box<AquayarAuthUser> getAquayarUser() {
    Hive.openBox<AquayarAuthUser>("aquayarAuthUser");

    return Hive.box<AquayarAuthUser>("aquayarAuthUser");
  }
}
