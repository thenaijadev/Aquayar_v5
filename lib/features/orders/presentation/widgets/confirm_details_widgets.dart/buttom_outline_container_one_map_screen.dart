import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/help&Support/presentation/widgets/horizontal_line.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/rounded_linear_progress_bar.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class ButtomMapScreenOne extends StatelessWidget {
  const ButtomMapScreenOne({super.key, required this.data});
  final Map<String, dynamic> data;

  String formatTime(String input) {
    List<String> parts = input.split(' '); // Split the input string into parts
    String hours = parts[0]; // Get the hours part
    String mins = parts[2]; // Get the mins part

    // Construct the formatted string
    String formattedTime = '${hours}h ${mins}m';

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    String formatNumberWithCommas(int number) {
      String formatted = number.toString();
      final RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      formatted = formatted.replaceAllMapped(regExp, (Match m) => '${m[1]},');
      return formatted;
    }

    return OutlinedContainer(
      color: Colors.white,
      borderRadius: 24,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/timer.png",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: data["time"].contains("hours") ||
                                data["time"].contains("hour")
                            ? formatTime(data["time"])
                            : data["time"],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const TextWidget(
                        text: 'Estimated Time of Delivery',
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/drop.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: data["waterSize"].round().toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const TextWidget(
                        text: "Liters",
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16.5,
          ),
          const HorizontalLineWidget(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/naira.png",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: 'Amount to Pay',
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      ),
                      TextWidget(
                        text: formatNumberWithCommas(data["price"]),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const TextWidget(
                    text: 'Scarcity level',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      width: 80,
                      decoration: const BoxDecoration(),
                      height: 10,
                      child: const RoundedProgressBar(
                        progress: .7,
                        height: 14,
                        progressColor: Color(0xff4e8000),
                        backgroundColor: Colors.white,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
