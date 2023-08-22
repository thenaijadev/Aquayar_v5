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
