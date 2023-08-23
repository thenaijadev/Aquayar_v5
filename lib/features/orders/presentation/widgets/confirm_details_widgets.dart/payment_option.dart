import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption(
      {super.key,
      required this.colors,
      this.color,
      required this.labelColor,
      required this.subTitleColor,
      required this.label,
      required this.subTitle,
      this.visibility = true});
  final List<Color> colors;
  final Color? color;
  final Color labelColor;
  final Color subTitleColor;
  final String label;
  final String subTitle;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        OutlinedContainer(
          color: color,
          borderRadius: 30,
          child: Row(children: [
            OutlinedContainer(
              borderRadius: 100,
              padding: const EdgeInsets.all(6),
              child: Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.75, -0.67),
                    end: const Alignment(-0.75, 0.67),
                    colors: colors,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/money.png"),
                    const SizedBox(
                      width: 8,
                    ),
                    TextWidget(
                      text: label,
                      color: labelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: 260,
                  child: Wrap(
                    children: [
                      TextWidget(
                        text: subTitle,
                        color: subTitleColor,
                        fontSize: 14,
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
        Visibility(
          visible: visibility,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2D000000),
                    blurRadius: 18,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                border: Border.all(color: AppColors.inputBorder),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              child: const Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: TextWidget(
                  text: "COMING SOON",
                  color: Color(0xFF868FAD),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
