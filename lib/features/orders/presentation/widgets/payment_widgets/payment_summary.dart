import 'package:aquayar/features/orders/presentation/widgets/payment_widgets/payment_data_row.dart';
import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentDataRow(
          label: "Water Price(500l)",
          data: "8000.00",
        ),
        PaymentDataRow(
          label: "Distance",
          data: "465.28",
        ),
        PaymentDataRow(
          label: "Booking Fee",
          data: "600.12",
        ),
        PaymentDataRow(
          label: "Total Amount",
          data: "9000.82",
        ),
      ],
    );
  }
}
