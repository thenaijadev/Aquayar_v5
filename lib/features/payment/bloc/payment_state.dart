part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

class PaymentStateError extends PaymentState {
  const PaymentStateError({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}

class PaymentStatePaymentProcessing extends PaymentState {}

class PaymentStatePaymentProcessStarted extends PaymentState {
  const PaymentStatePaymentProcessStarted({required this.paymentDetails});

  final PaymentDetails paymentDetails;

  @override
  List<Object> get props => [paymentDetails];
}
