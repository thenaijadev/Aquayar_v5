import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/menu_widgets/horizontal_rule_widget.dart';
import 'package:flutter/material.dart';

class HelpTile extends StatelessWidget {
  const HelpTile({super.key, required this.onTap, required this.label});
  final void Function() onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: label,
                  fontSize: 18,
                ),
                Image.asset("assets/images/chevron_right.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const HorizontalRuleWidget()
        ],
      ),
    );
  }
}
