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
