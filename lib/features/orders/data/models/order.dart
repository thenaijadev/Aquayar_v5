import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  Order(
    this.orderId,
    this.customerId,
    this.driverId,
    this.waterSize,
    this.price,
    this.distance,
  );
  final String orderId;
  final String customerId;
  final String driverId;
  final int waterSize;
  final double price;
  final double distance;

  @override
  String toString() {
    return 'Order(orderId: $orderId, customerId: $customerId, driverId: $driverId, waterSize: $waterSize, price: $price, distance: $distance)';
  }

  Order copyWith({
    String? orderId,
    String? customerId,
    String? driverId,
    int? waterSize,
    double? price,
    double? distance,
  }) {
    return Order(
      orderId ?? this.orderId,
      customerId ?? this.customerId,
      driverId ?? this.driverId,
      waterSize ?? this.waterSize,
      price ?? this.price,
      distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'customerId': customerId,
      'driverId': driverId,
      'waterSize': waterSize,
      'price': price,
      'distance': distance,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    final data = map["data"];
    return Order(
      data["id"] as String,
      data['customer'] as String,
      data["driver"] as String,
      data['waterSize'] as int,
      data['price'] as double,
      data['distance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.customerId == customerId &&
        other.driverId == driverId &&
        other.waterSize == waterSize &&
        other.price == price &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        customerId.hashCode ^
        driverId.hashCode ^
        waterSize.hashCode ^
        price.hashCode ^
        distance.hashCode;
  }
}
