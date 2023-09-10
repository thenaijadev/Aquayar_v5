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

class OrderEventCreatOrder extends OrderEvent {
  const OrderEventCreatOrder({
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
