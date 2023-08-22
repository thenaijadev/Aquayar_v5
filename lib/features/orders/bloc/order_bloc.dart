import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:aquayar/features/orders/data/repo/order_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/models/driver.dart';

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

    on<OrderEventGetNearestDriver>((event, emit) async {
      emit(OrderStateGetNearestDriverIsLoading());

      final double waterSize = event.waterSize;
      final String address = event.address;

      final location = await LocationProvider().getPlace(address);

      final driver = await repo.getNearestDriver(
        waterSize: waterSize,
        longitude: location?["geometry"]["location"]["lng"],
        latitude: location?["geometry"]["location"]["lat"],
      );

      driver.fold((l) {
        emit(OrderStateGetNearestDiverError(error: l));
      }, (r) {
        emit(OrderStateGetNearestDriverFound(driver: r));
      });

      print({
        waterSize,
        location?["geometry"]["location"]["lng"],
        location?["geometry"]["location"]["lat"],
      });
    });
  }
}
