// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Driver {
  Driver({
    required this.id,
    required this.coordinates,
  });
  final String id;
  final List<dynamic> coordinates;

  Driver copyWith({
    String? id,
    List<dynamic>? coordinates,
  }) {
    return Driver(
      id: id ?? this.id,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'coordinates': coordinates,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
        id: map['id'] as String,
        coordinates: List<dynamic>.from(
          (map['coordinates'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) =>
      Driver.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Driver(id: $id, coordinates: $coordinates)';

  @override
  bool operator ==(covariant Driver other) {
    if (identical(this, other)) return true;

    return other.id == id && listEquals(other.coordinates, coordinates);
  }

  @override
  int get hashCode => id.hashCode ^ coordinates.hashCode;
}
