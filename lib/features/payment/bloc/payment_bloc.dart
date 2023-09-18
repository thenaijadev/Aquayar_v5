import 'package:aquayar/features/payment/data/models/payment_details.dart';
import 'package:aquayar/features/payment/data/repositories/payment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(PaymentRepository repo) : super(PaymentInitial()) {
    on<PaymentEventStartPaymentProcess>((event, emit) async {
      emit(PaymentStatePaymentProcessing());
      final String token = event.token;
      final String orderId = event.orderID;

      final response = await repo.payForOrder(
        orderId: orderId,
        token: token,
      );
      response.fold((l) => emit(PaymentStateError(error: l)), (r) {
        emit(PaymentStatePaymentProcessStarted(paymentDetails: r));
        print(r.toString());
      });
    });
  }
}
