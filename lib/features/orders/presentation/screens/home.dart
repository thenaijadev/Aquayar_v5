import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/no_order_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/order_widget.dart';
import 'package:aquayar/features/user/bloc/bloc/user_bloc.dart';
import 'package:clay_containers/clay_containers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool noOrder = false;
  late Box<AquayarAuthUser> authUserBox;
  late Box<Address> addressBox;
  @override
  void initState() {
    final OrderBloc orderBloc = context.read<OrderBloc>();
    orderBloc.add(OrderEventGetOrders());

    super.initState();
  }

  @override
  void dispose() {
    authUserBox.close();
    addressBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderStateOrderRetrieved) {
            if (state.orders.isNotEmpty) {
              return SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.orderWater);
                  },
                  child: ClayContainer(
                    color: const Color.fromARGB(255, 4, 136, 231),
                    parentColor: Colors.white,
                    height: 150,
                    width: 250,
                    depth: 40,
                    borderRadius: 75,
                    curveType: CurveType.convex,
                    child: Image.asset("assets/images/drop_icon.png"),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
          return const SizedBox();
        },
      ),
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
