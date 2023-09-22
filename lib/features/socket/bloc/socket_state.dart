part of 'socket_bloc.dart';

sealed class SocketState extends Equatable {
  const SocketState();

  @override
  List<Object> get props => [];
}

final class SocketInitial extends SocketState {}

final class SocketStateConnectedToHost extends SocketState {}

final class SocketStateConnectingToHost extends SocketState {}

final class SocketStateConnectionError extends SocketState {}

final class SocketStateDisconnectedFromHost extends SocketState {}

final class SocketStateDispatchingOrder extends SocketState {}

final class SocketStateOrderDispatched extends SocketState {
  final Action action;
  const SocketStateOrderDispatched({required this.action});

  @override
  List<Object> get props => [action];
}
