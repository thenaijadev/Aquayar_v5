part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderEventGetOrders extends OrderEvent {}

class OrderEventGetNearestDriver extends OrderEvent {
  const OrderEventGetNearestDriver(
      {required this.waterSize, required this.address});

  final double waterSize;
  final String address;
}

class OrderEventCreateOrder extends OrderEvent {
  const OrderEventCreateOrder({
    required this.token,
    required this.waterSize,
    required this.startLocation,
    required this.endLocation,
    required this.price,
    required this.driver,
  });
  final String token;
  final double waterSize;
  final String startLocation;
  final String endLocation;

  final double price;
  final String driver;
}

class OrderEventGetOrderDetails extends OrderEvent {
  const OrderEventGetOrderDetails({
    required this.token,
    required this.orderId,
  });
  final String token;
  final double orderId;
}

class OrderEventCancelOrder extends OrderEvent {
  const OrderEventCancelOrder({
    required this.token,
    required this.orderId,
  });
  final String token;
  final String orderId;
}

class OrderEventPayForOrder extends OrderEvent {
  const OrderEventPayForOrder({
    required this.token,
    required this.orderId,
    required this.email,
    required this.price,
  });
  final String token;
  final String orderId;
  final String email;
  final String price;
}
