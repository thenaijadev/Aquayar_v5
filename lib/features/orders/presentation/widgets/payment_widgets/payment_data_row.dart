import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PaymentDataRow extends StatelessWidget {
  const PaymentDataRow({super.key, required this.label, required this.data});
  final String label;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: label,
            color: const Color(0xFF868FAD),
            fontSize: 14,
          ),
          TextWidget(
            text: "₦$data",
            color: const Color(0xFF868FAD),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
