import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/payment/data/providers/payment_provider.dart';

class PaymentRepository {
  final PaymentProvider provider;
  PaymentRepository(this.provider);

  factory PaymentRepository.getProvider() =>
      PaymentRepository(PaymentProvider());

  EitherPaymentDetails payForOrder({
    required String token,
    required String orderId,
  }) async {
    final response = await provider.payForOrder(
      token: token,
      orderId: orderId,
    );
    return response;
  }
}
