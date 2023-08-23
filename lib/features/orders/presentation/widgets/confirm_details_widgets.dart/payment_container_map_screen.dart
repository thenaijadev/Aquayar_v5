import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';

import 'package:flutter/material.dart';

import 'payment_method_bottom_sheet.dart';

class PaymentContainerMapScreen extends StatelessWidget {
  const PaymentContainerMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      padding: const EdgeInsets.all(12),
      borderRadius: 18,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Mode of Payment",
            color: Color(0xFF868FAD),
            fontSize: 14,
          ),
          Row(
            children: [
              const TextWidget(
                text: "Cash",
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset("assets/images/money.png"),
              const SizedBox(
                width: 29,
              ),
              GestureDetector(
                onTap: () {
                  showPaymentMethodBottomSheet(context);
                },
                child: const Icon(
                  Icons.expand_more_outlined,
                  color: AppColors.titleBlack,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
