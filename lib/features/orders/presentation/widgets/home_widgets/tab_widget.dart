import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key, required this.onTap, required this.label});
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: OutlinedContainer(
        padding:
            const EdgeInsets.only(bottom: 15, left: 16, top: 21, right: 22),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F030D45),
            blurRadius: 24,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
        onTap: onTap,
        borderRadius: 25,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "$label   ",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color(0xFFF2F2F2),
                    child: Image.asset("assets/images/arrow_right.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
