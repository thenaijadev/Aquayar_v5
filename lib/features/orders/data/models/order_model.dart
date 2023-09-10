// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  OrderModel({
    required this.id,
    required this.waterSize,
    required this.price,
    required this.distance,
    required this.status,
  });
  final String id;
  final int waterSize;
  final int price;
  final int distance;
  final String status;

  OrderModel copyWith({
    String? id,
    int? waterSize,
    int? price,
    int? distance,
    String? pending,
  }) {
    return OrderModel(
      id: id ?? this.id,
      waterSize: waterSize ?? this.waterSize,
      price: price ?? this.price,
      distance: distance ?? this.distance,
      status: pending ?? status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'waterSize': waterSize,
      'price': price,
      'distance': distance,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    final data = map["data"];
    return OrderModel(
      id: data['id'] as String,
      waterSize: data['waterSize'] as int,
      price: data['price'] as int,
      distance: data['distance'] as int,
      status: data['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, waterSize: $waterSize, price: $price, distance: $distance, status: $status)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.waterSize == waterSize &&
        other.price == price &&
        other.distance == distance &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        waterSize.hashCode ^
        price.hashCode ^
        distance.hashCode ^
        status.hashCode;
  }
}
