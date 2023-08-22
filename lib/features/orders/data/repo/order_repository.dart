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
}
