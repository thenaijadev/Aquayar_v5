// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'aquayar_auth_user.g.dart';

@HiveType(typeId: 0)
class AquayarAuthUser extends HiveObject {
  @HiveField(0)
  late String? id;
  @HiveField(1)
  late String? email;
  @HiveField(2)
  late bool? isVerified;
  @HiveField(3)
  late String? userType;
  @HiveField(4)
  late String? phone;
  @HiveField(5)
  late String? authToken;
  @HiveField(6)
  late String? displayName;
  @HiveField(7)
  late String? photoUrl;
  @HiveField(8)
  late String? gender;
  @HiveField(9)
  late double? waterSize;
  @HiveField(10)
  late String? address;
  @HiveField(11)
  late String? city;
  @HiveField(12)
  late String? addressName;

  AquayarAuthUser(
      {required this.authToken,
      required this.photoUrl,
      required this.address,
      required this.waterSize,
      required this.id,
      this.city,
      this.addressName,
      required this.phone,
      required this.displayName,
      required this.email,
      required this.isVerified,
      this.gender,
      this.userType = "customer"});

  factory AquayarAuthUser.fromJson(
    user,
  ) {
    return AquayarAuthUser(
        id: user["data"]["user"]["id"],
        isVerified: false,
        email: user["email"],
        displayName: user["displayName"],
        phone: "",
        photoUrl: user["photoUrl"],
        userType: "customer",
        address: "address",
        authToken: user["data"]["token"],
        waterSize: user["waterSize"]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'isVerified': isVerified,
      'userType': userType,
      'phone': phone,
      'authToken': authToken,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'gender': gender,
      "waterSize": waterSize,
    };
  }

  factory AquayarAuthUser.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    return AquayarAuthUser(
      id: data != null ? data['id'] as String : null,
      email: data != null ? data['email'] as String : null,
      waterSize: data != null ? data["waterSize"] as double : null,
      isVerified: map['isVerified'] as bool?,
      userType: data['type'] as String?,
      phone: data['phoneNo'] as String?,
      authToken: map['authToken'] as String?,
      displayName: data != null ? data['displayName'] as String? : null,
      photoUrl: map['photoUrl'] as String?,
      gender: data['gender'] as String?,
      address: '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AquayarAuthUser(id: $id, email: $email, isVerified: $isVerified, userType: $userType, phone: $phone, authToken: $authToken, displayName: $displayName, photoUrl: $photoUrl, gender: $gender, waterSize: $waterSize, address: $address, city: $city, addressName: $addressName)';
  }
}
