// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverModel {
  DriverModel(
      {required this.id,
      required this.displayName,
      required this.rating,
      required this.licensePlate,
      required this.mainColor,
      required this.selfieImage,
      required this.trips});

  final String id;
  final String displayName;
  final double rating;
  final String licensePlate;
  final String mainColor;
  final String selfieImage;
  final int trips;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'rating': rating,
      'licensePlate': licensePlate,
      'mainColor': mainColor,
      'selfieImage': selfieImage,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    final data = map["data"]["driver"];
    return DriverModel(
      id: data['id'] as String,
      displayName: data['displayName'] as String,
      rating: data['rating'] as double,
      licensePlate: data['licensePlate'] as String,
      mainColor: data['mainColor'] as String,
      selfieImage: data['selfie'] as String,
      trips: data['trips'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverModel(id: $id, displayName: $displayName, rating: $rating, licensePlate: $licensePlate, mainColor: $mainColor, selfieImage: $selfieImage)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.displayName == displayName &&
        other.rating == rating &&
        other.licensePlate == licensePlate &&
        other.mainColor == mainColor &&
        other.selfieImage == selfieImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        displayName.hashCode ^
        rating.hashCode ^
        licensePlate.hashCode ^
        mainColor.hashCode ^
        selfieImage.hashCode;
  }
}
