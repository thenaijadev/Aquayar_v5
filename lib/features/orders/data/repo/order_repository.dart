import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/orders/data/provider/order_provider_implementation.dart';

class OrderRepository {
  final OrderProviderImplementation provider;
  OrderRepository(this.provider);

  factory OrderRepository.getProvider() =>
      OrderRepository(OrderProviderImplementation());

  EitherList getAllOrders() async {
    return await provider.getAllOrders();
  }

  EitherDriver getNearestDriver({
    required double waterSize,
    required double longitude,
    required double latitude,
  }) async {
    final response = await provider.getNearestDriver(
      waterSize: waterSize,
      longitude: longitude,
      latitude: latitude,
    );

    return response;
  }

  EitherMap getPrice(
      {required double waterSize,
      required String token,
      required String startLocation,
      required String endLocation}) async {
    final response = await provider.getPrice(
        waterSize: waterSize,
        token: token,
        startLocation: startLocation,
        endLocation: endLocation);

    return response;
  }

  EitherMap createOrder({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
    required double price,
    required String driver,
  }) async {
    final response = await provider.createOrder(
        waterSize: waterSize,
        token: token,
        startLocation: startLocation,
        endLocation: endLocation,
        price: price,
        driver: driver);

    return response;
  }
}
