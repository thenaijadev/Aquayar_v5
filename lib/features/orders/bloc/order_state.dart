part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class OrderStateIsLoading extends OrderState {}

class OrderStateError extends OrderState {
  final String error;
  const OrderStateError({required this.error});
  @override
  List<Object> get props => [error];
}

class OrderStateOrderRetrieved extends OrderState {
  final List<dynamic> orders;
  const OrderStateOrderRetrieved({required this.orders});
  @override
  List<Object> get props => [orders];
}

class OrderStateGetNearestDriverFound extends OrderState {
  const OrderStateGetNearestDriverFound({required this.driver});
  final Driver driver;
}

class OrderStateGetNearestDriverIsLoading extends OrderState {}

class OrderStateGetNearestDiverError extends OrderState {
  const OrderStateGetNearestDiverError({required this.error});
  final String error;
}

class OrderStatePriceRetrieved extends OrderState {
  const OrderStatePriceRetrieved({
    required this.time,
    required this.price,
    required this.distance,
  });
  final int price;
  final String time;
  final double distance;
}

class OrderStateGetPriceError extends OrderState {
  const OrderStateGetPriceError({required this.error});
  final String error;
}

class OrderEventGetPrice extends OrderEvent {
  const OrderEventGetPrice({
    required this.startLocation,
    required this.endLocation,
    required this.token,
    required this.waterSize,
  });
  final String token;
  final double waterSize;

  final String startLocation;
  final String endLocation;
}

class OrderStateOrderCreated extends OrderState {
  const OrderStateOrderCreated({required this.order});
  final Order order;
}

class OrderStateOrderDetailsRetrieved extends OrderState {
  const OrderStateOrderDetailsRetrieved(
      {required this.order, required this.driver});
  final OrderModel order;
  final DriverModel driver;
}

class OrderStateOrderCanceled extends OrderState {
  const OrderStateOrderCanceled();
}

class OrderStateCancelError extends OrderState {
  const OrderStateCancelError({required this.error});
  final String error;
}

class OrderStateOrderCancelling extends OrderState {
  const OrderStateOrderCancelling();
}

class OrderStateOrderPaymentMade extends OrderState {
  const OrderStateOrderPaymentMade();
}

class OrderStatePayingForOrder extends OrderState {
  const OrderStatePayingForOrder();
}
