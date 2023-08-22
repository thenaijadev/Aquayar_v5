import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/no_order_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/order_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool noOrder = false;

  @override
  void initState() {
    final OrderBloc orderBloc = context.read<OrderBloc>();
    orderBloc.add(OrderEventGetOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is UserStateIsLoading) {
                return const Center(
                  child: SpinKitSpinningLines(
                    color: Color.fromARGB(255, 4, 136, 231),
                    size: 40.0,
                  ),
                );
              } else if (state is OrderStateOrderRetrieved) {
                return SingleChildScrollView(
                    child: state.orders.isEmpty
                        ? const NoOrderWidget()
                        : OrderWidget(orders: state.orders));
              } else {
                return const SingleChildScrollView(
                  child: NoOrderWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
