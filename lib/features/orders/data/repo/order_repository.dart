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
}
