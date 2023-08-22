import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<Address> getAddresses() => Hive.box<Address>('address');
}
