import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/blue_icon.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/buttom_outline_container_map_screen_two.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/buttom_outline_container_one_map_screen.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/direction_map_less.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/direction_map_more.dart';
import 'package:aquayar/features/orders/presentation/widgets/confirm_details_widgets.dart/payment_container_map_screen.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmDetails extends StatefulWidget {
  const ConfirmDetails({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  String step = "one";
  @override
  void initState() {
    final orderBloc = context.read<OrderBloc>();
    orderBloc.add(OrderEventGetPrice(
        startLocation: widget.data["address"],
        endLocation:
            "${widget.data["driver"].coordinates[1]},${widget.data["driver"].coordinates[0]}",
        token: widget.data["token"],
        waterSize: widget.data["waterSize"]));

    super.initState();
  }

  bool showMore = false;
  late Map<String, dynamic> theData;
  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();

    LocationProvider().getTransitTime(widget.data["address"],
        "${widget.data["driver"].coordinates[1]},${widget.data["driver"].coordinates[0]}");
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state is OrderStateOrderCreated
                  ? const TextWidget(
                      text: "Your delivery is underway",
                      color: Color(0xFF20254F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  : state is OrderStateOrderDetailsRetrieved
                      ? const TextWidget(
                          text: "Your delivery is underway...",
                          color: Color(0xFF20254F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextWidget(
                          text: "Confirm details",
                          color: Color(0xFF20254F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state is OrderStateOrderCreated ||
                      state is OrderStateOrderDetailsRetrieved
                  ? GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        "assets/images/x.png",
                        width: 24,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        "assets/images/arrow_left.png",
                        width: 24,
                      ),
                    );
            },
          )),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 26),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.disabledBtn,
                  border: Border.all(
                    color: AppColors.inputBorder,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 390.0),
                  child: Transform.scale(
                      scale: .6,
                      child: Image.asset("assets/images/map_update_tag.png")),
                )
                // child: MapSample(
                //     // onTap:(){},
                //     startPosition: widget.data["address"],
                //     endPosition:
                //         "${widget.data["driver"].coordinates[1]},${widget.data["driver"].coordinates[0]}"),
                ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedContainer(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 24, right: 25),
                        borderRadius: 100,
                        child: Row(
                          children: [
                            const TextWidget(
                              text: "Delivering to:",
                              color: Color(0xFFADAFC2),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 120,
                              child: TextWidget(
                                overflow: TextOverflow.ellipsis,
                                text: widget.data["address"],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    BlocListener<OrderBloc, OrderState>(
                      listener: (context, state) {
                        if (state is OrderStateOrderCancelling) {
                          Navigator.pushReplacementNamed(
                              context, Routes.orderCancellingLoading);
                        }
                      },
                      child: BlocBuilder<OrderBloc, OrderState>(
                        builder: (context, state) {
                          return state is OrderStateOrderDetailsRetrieved
                              ? GestureDetector(
                                  onTap: () {
                                    orderBloc.add(OrderEventCancelOrder(
                                        token: widget.data["token"],
                                        orderId: state.order.id));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: OutlinedContainer(
                                      color: Colors.white,
                                      borderRadius: 100,
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/images/red_trash.png",
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: step == "one" ? 20 : 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        step == "one"
                            ? const PaymentContainerMapScreen()
                            : const Text(""),
                        GestureDetector(
                            onTap: () {}, child: const BlueArrowMouseIcon()),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        if (state is OrderStateIsLoading) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: ButtomMapScreenTwo(
                                waterSize: widget.data["waterSize"]),
                          );
                        } else if (state is OrderStatePriceRetrieved) {
                          theData = {
                            "price": state.price,
                            ...widget.data,
                            "time": state.time,
                            "distance": state.distance
                          };

                          return Column(
                            children: [
                              ButtomMapScreenOne(data: theData),
                              const SizedBox(
                                height: 15,
                              ),
                              Transform.scale(
                                scaleX: 1.07,
                                child: GestureDetector(
                                  onTap: () {
                                    orderBloc.add(OrderEventCreateOrder(
                                        token: widget.data["token"],
                                        waterSize: widget.data["waterSize"],
                                        startLocation: widget.data["address"],
                                        endLocation: "6.8429,7.3733",
                                        price: state.price.toDouble(),
                                        driver: widget.data["driver"].id));
                                  },
                                  child: Image.asset(
                                    "assets/images/confirm_blue.png",
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (state is OrderStateOrderDetailsRetrieved) {
                          return Column(
                            children: [
                              showMore
                                  ? DirectionMapScreenMore(
                                      driver: state.driver,
                                      order: state.order,
                                      data: theData,
                                      showLessOnMap: () {
                                        setState(() {
                                          showMore = false;
                                        });
                                      })
                                  : DirectionMapScreenLess(
                                      order: state.order,
                                      data: theData,
                                      driver: state.driver,
                                      showMoreOnTap: () {
                                        setState(() {
                                          showMore = true;
                                        });
                                      }),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
