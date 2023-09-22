part of 'socket_bloc.dart';

sealed class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object> get props => [];
}

class SocketEventConnectToHost extends SocketEvent {
  final String authToken;
  const SocketEventConnectToHost({required this.authToken});
}

class SocketEventDispatchOrder extends SocketEvent {
  final String orderId;

  final String driverId;
  const SocketEventDispatchOrder(
      {required this.orderId, required this.driverId});
}
