import 'package:hive/hive.dart';
part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  Address({
    this.name = "Home",
    required this.address,
  });
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String address;
}
