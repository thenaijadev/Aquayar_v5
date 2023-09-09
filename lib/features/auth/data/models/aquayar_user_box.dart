import 'package:aquayar/core/services/locator.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AquayarBox {
  static Box<AquayarAuthUser> getAquayarUser() {
    return locator.get<Box<AquayarAuthUser>>();
  }
}
