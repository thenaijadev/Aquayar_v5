import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/payment_widgets/payment_data_row.dart';
import 'package:aquayar/features/orders/presentation/widgets/payment_widgets/payment_summary.dart';
import 'package:aquayar/features/orders/presentation/widgets/payment_widgets/wave_painter.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 6500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: WavePainter(
                    animationValue: _animation.value,
                    waveColor: const Color(0xff0579CE),
                    waveHeight: 0.40,
                    waveAmplitude: 10.0,
                    waveFrequency: 2,
                  ),
                );
              },
            ),
          ),
          const Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                ),
                TextWidget(
                  text: "Order Complete!",
                  fontSize: 33,
                  color: AppColors.titleBlack,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextWidget(
                    textAlign: TextAlign.center,
                    text:
                        "Make a payment to through aquayar and upgrade your level, enjoy more benefits, like free delivery at random and increase your rating.",
                    fontSize: 14,
                    color: Color(0xff868FAE),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                PaymentSummary(),
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
