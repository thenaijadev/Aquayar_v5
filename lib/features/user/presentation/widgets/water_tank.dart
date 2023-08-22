import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/features/user/presentation/widgets/water_view.dart';
import 'package:flutter/material.dart';

class WaterTank extends StatelessWidget {
  const WaterTank({super.key, required this.number});
  final double number;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: AppColors.inputBorder),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80.0),
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0),
              topRight: Radius.circular(80.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(2, 4),
                blurRadius: 10),
          ],
        ),
        child: WaveView(
          percentageValue: number,
        ),
      ),
    );
  }
}
