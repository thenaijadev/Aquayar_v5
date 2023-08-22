import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/locations/data/models/address_box.dart';
import 'package:hive/hive.dart';

class AddressStorage {
  static Future<void> addAddress({required address}) async {
    await Hive.openBox<Address>("address");
    final Address theAddress = Address(address: address);
    final box = Boxes.getAddresses();

    if (box.length < 2) {
      box.add(theAddress);
    }
  }

  static Future<void> deleteAddress({required Address address}) async {
    address.delete();
  }

  static Future<void> editName(
      {required Address address, required String name}) async {
    address.name = name;
    address.save();
  }

  static Future<void> editAddress(
      {required Address address, required String location}) async {
    address.address = location;
    address.save();
  }
}
