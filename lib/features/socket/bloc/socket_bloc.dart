import 'package:aquayar/features/socket/models/actions.dart';
import 'package:aquayar/features/socket/repositories/socket_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(SocketInitial()) {
    on<SocketEventConnectToHost>((event, emit) {
      emit(SocketStateConnectingToHost());
      final bool isConnected = SocketRepository.connectToHost();

      if (isConnected == true) {
        emit(SocketStateConnectedToHost());
      } else {
        emit(SocketStateConnectionError());
      }
    });

    on<SocketEventDispatchOrder>((event, emit) {
      emit(SocketStateDispatchingOrder());
      final String action = SocketRepository.dispatchOrder(
          orderId: event.orderId, driverId: event.driverId);

      if (action == "accept") {
        emit(SocketStateOrderDispatched(action: OrderAccepted()));
      } else {
        emit(SocketStateOrderDispatched(action: OrderRejected()));
      }
    });
  }
}
