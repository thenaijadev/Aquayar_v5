import 'package:aquayar/features/orders/data/repo/order_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderRepository repo) : super(OrderInitial()) {
    on<OrderEventGetOrders>((event, emit) async {
      emit(OrderStateIsLoading());
      final orders = await repo.getAllOrders();
      orders.fold((l) => emit(OrderStateError(error: l)), (r) {
        emit(OrderStateOrderRetrieved(orders: r));
      });
    });
  }
}
