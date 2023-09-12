import 'package:aquayar/core/widgets/loading_widget.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCancelLoading extends StatelessWidget {
  const OrderCancelLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is OrderStateOrderCanceled) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return const Center(
            child: LoadingWidget(),
          );
        },
      ),
    );
  }
}
