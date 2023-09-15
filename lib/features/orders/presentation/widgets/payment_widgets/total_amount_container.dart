import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class TotalAmountContainer extends StatelessWidget {
  const TotalAmountContainer({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: OutlinedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
        borderRadius: 30,
        child: Column(
          children: [
            const TextWidget(
              text: "Amount to Pay",
              color: Color(0xFF868FAD),
            ),
            TextWidget(
              text: "₦$amount",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
