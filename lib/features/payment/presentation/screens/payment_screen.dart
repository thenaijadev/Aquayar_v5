import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:aquayar/features/payment/bloc/payment_bloc.dart';
import 'package:aquayar/features/payment/presentation/widgets/payment_summary.dart';
import 'package:aquayar/features/payment/presentation/widgets/total_amount_container.dart';
import 'package:aquayar/features/payment/presentation/widgets/wave_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.id});
  final String id;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  var publicKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';
  final plugin = PaystackPlugin();
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
    plugin.initialize(publicKey: publicKey);
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
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const TextWidget(
                  text: "Order Complete!",
                  fontSize: 33,
                  color: AppColors.titleBlack,
                  fontWeight: FontWeight.bold,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextWidget(
                    textAlign: TextAlign.center,
                    text:
                        "Make a payment to through aquayar and upgrade your level, enjoy more benefits, like free delivery at random and increase your rating.",
                    fontSize: 14,
                    color: Color(0xff868FAE),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const PaymentSummary(),
                BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        final PaymentBloc bloc = context.read<PaymentBloc>();
                        final AquayarAuthUser user =
                            AquayarBox.getAquayarUser().values.last;
                        bloc.add(PaymentEventStartPaymentProcess(
                          token: user.authToken!,
                          orderID: widget.id,
                        ));
                      },
                      child: const TotalAmountContainer(
                        amount: "9000.82",
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 150,
                ),
                const SizedBox(
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
