import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:aquayar/features/orders/data/models/driver_model.dart';
import 'package:aquayar/features/orders/data/models/order.dart';
import 'package:aquayar/features/orders/data/models/order_model.dart';
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
    });

    on<OrderEventGetPrice>((event, emit) async {
      emit(OrderStateIsLoading());
      final String token = event.token;
      final double waterSize = event.waterSize;
      final String startLocation = event.startLocation;
      final String endLocation = event.endLocation;

      final response = await repo.getPrice(
          startLocation: startLocation,
          endLocation: endLocation,
          waterSize: waterSize,
          token: token);
      response.fold((l) => emit(OrderStateGetPriceError(error: l)), (r) {
        emit(OrderStatePriceRetrieved(
            distance: r["distance"],
            price: r["data"]["price"] ?? 200,
            time: r["time"]));
      });
    });

    on<OrderEventCancelOrder>((event, emit) async {
      emit(const OrderStateOrderCancelling());
      final String token = event.token;
      final String orderId = event.orderId;

      final response = await repo.cancelOrder(
        orderId: orderId,
        token: token,
      );
      response.fold((l) => emit(OrderStateCancelError(error: l)), (r) {
        emit(const OrderStateOrderCanceled());
      });
    });

    on<OrderEventCreateOrder>((event, emit) async {
      emit(OrderStateIsLoading());

      final String token = event.token;
      final String startLocation = event.startLocation;
      final String endLocation = event.endLocation;
      final double price = event.price;
      final double waterSize = event.waterSize;

      final String driver = event.driver;

      final response = await repo.createOrder(
          driver: driver,
          price: price,
          endLocation: endLocation,
          startLocation: startLocation,
          waterSize: waterSize,
          token: token);

      response.fold((l) => emit(OrderStateGetPriceError(error: l)), (r) async {
        final Order order = Order.fromMap(r);
        emit(OrderStateOrderCreated(order: order));
      });

      final state = this.state;
      if (state is OrderStateOrderCreated) {
        final orderDetails = await repo.getOrderDetails(
            token: token, orderId: state.order.orderId);
        orderDetails.fold((l) => null, (r) {
          final OrderModel order = OrderModel.fromMap(r);
          final DriverModel driver = DriverModel.fromMap(r);
          print(driver.toString());
          emit(OrderStateOrderDetailsRetrieved(
            order: order.copyWith(id: state.order.orderId),
            driver: driver,
          ));
        });
      }
    });
  }
}
