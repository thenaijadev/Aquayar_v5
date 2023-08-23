import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/payment_option.dart';

import 'package:flutter/material.dart';

void showPaymentMethodBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/x.png")),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: "Payment Methods",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 50,
                ),
                const PaymentOption(
                  label: "Cash Payment",
                  visibility: false,
                  subTitle:
                      "You’ll make a bank transfer to a designated Aquayar account.",
                  subTitleColor: Color(0xFF868FAD),
                  labelColor: Color(0xFF20254F),
                  colors: [Color(0xFF60C6F9), Color(0xFF0479CD)],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PaymentOption(
                  label: "Credit Card",
                  labelColor: Color(0xFFADAFC2),
                  subTitle:
                      "Use your vitual or physical cards to make payment or for your water bookings",
                  color: Color(0xFFFAFAFA),
                  subTitleColor: Color(0xFFADAFC2),
                  colors: [Colors.white, Colors.white],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PaymentOption(
                  label: "Wallet",
                  subTitle:
                      'Fund your aquayar wallet and make withdrawals, and payments and enjoy huge discounts.',
                  subTitleColor: Color(0xFFADAFC2),
                  labelColor: Color(0xFFADAFC2),
                  color: Color(0xFFFAFAFA),
                  colors: [Colors.white, Colors.white],
                )
              ],
            ),
          ));
    },
  );
}
