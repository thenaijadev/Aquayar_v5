import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/help&Support/presentation/widgets/horizontal_line.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/rounded_linear_progress_bar.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:aquayar/features/user/presentation/widgets/water_tank.dart';
import 'package:flutter/material.dart';

class ButtomMapScreenTwo extends StatelessWidget {
  const ButtomMapScreenTwo({super.key, required this.waterSize});
  final double waterSize;
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      color: Colors.white,
      borderRadius: 24,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/timer.png",
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Calculating...",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: 'Estimated Time of Delivery',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Row(
                  children: [
                    Image.asset("assets/images/drop.png"),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: waterSize.round().toString(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const TextWidget(
                          text: "Liters",
                          color: Color(0xFF868FAD),
                          fontSize: 13,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const HorizontalLineWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.asset("assets/images/loading_frame.png"),
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  height: 2,
                  child: const RoundedProgressBar(
                    progress: .3,
                    height: 14,
                    progressColor: Color.fromARGB(199, 4, 121, 205),
                    backgroundColor: Colors.white,
                  )),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const SizedBox(
                          width: 52, height: 52, child: WaterTank(number: 85)),
                      Image.asset("assets/images/water_drop.png")
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Searching nearby drivers...',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: 'You’ll be matched in approx (3) secs',
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
