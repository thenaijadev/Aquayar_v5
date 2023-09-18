part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentEventStartPaymentProcess extends PaymentEvent {
  PaymentEventStartPaymentProcess({required this.token, required this.orderID});
  final String token;
  final String orderID;
}
