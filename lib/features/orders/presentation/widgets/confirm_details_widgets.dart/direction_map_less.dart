import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/help&Support/presentation/widgets/horizontal_line.dart';
import 'package:aquayar/features/orders/data/models/driver_model.dart';
import 'package:aquayar/features/orders/data/models/order_model.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:aquayar/features/socket/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectionMapScreenLess extends StatefulWidget {
  const DirectionMapScreenLess(
      {super.key,
      required this.showMoreOnTap,
      required this.data,
      required this.driver,
      required this.order});
  final void Function() showMoreOnTap;
  final Map<String, dynamic> data;
  final OrderModel order;
  final DriverModel driver;
  @override
  State<DirectionMapScreenLess> createState() => _DirectionMapScreenLessState();
}

class _DirectionMapScreenLessState extends State<DirectionMapScreenLess> {
  // _connectSocket() {
  //   final IO.Socket socket = IO.io(
  //       RoutesAndPaths.baseUrl,
  //       IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders({
  //         'Authorization': 'Bearer ${widget.data["token"]}',
  //       }).build());
  //   socket.onConnect((data) {
  //     print("Connection established:$data");
  //   });
  //   socket.onConnectError((data) => print("Connection error: $data"));
  //   socket.onDisconnect((data) => print("Socket.o disconnected"));
  // }

  @override
  void initState() {
    // final SocketBloc bloc = context.read<SocketBloc>();
    // bloc.add(SocketEventConnectToHost(
    //     authToken: widget.data["token"],
    //     orderId: widget.order.id,
    //     driverId: widget.driver.id));
    // bloc.add(SocketEventDispatchOrder(
    //     orderId: widget.order.id, driverId: widget.driver.id));
    SocketProvider controller = Get.find<SocketProvider>();

    controller.connectToHost();
    controller.dispatchOrder(
        orderId: widget.order.id, driverId: widget.driver.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formatTime(String input) {
      List<String> parts = input.split(' ');
      String hours = parts[0];
      String mins = parts[2];

      String formattedTime = '${hours}h ${mins}m';

      return formattedTime;
    }

    return OutlinedContainer(
      color: Colors.white,
      borderRadius: 24,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextWidget(
                      text: widget.data["time"].contains("hours") ||
                              widget.data["time"].contains("hour")
                          ? formatTime(widget.data["time"])
                          : widget.data["time"],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const TextWidget(
                    text: "Est. Time",
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  )
                ],
              ),
              Column(
                children: [
                  TextWidget(
                      text:
                          "${(widget.data["distance"] / 1000).toStringAsFixed(1)}KM",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const TextWidget(
                    text: "Distance",
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  )
                ],
              ),
              const Column(
                children: [
                  TextWidget(
                      text: "500", fontSize: 20, fontWeight: FontWeight.bold),
                  TextWidget(
                    text: "Liters",
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16.5,
          ),
          const HorizontalLineWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 4, color: Colors.white)),
                      child: Image.asset("assets/images/head.png"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: widget.driver.displayName,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            const TextWidget(
                              text: "Driver",
                              color: Color(0xFF868FAD),
                              fontSize: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              text: widget.driver.licensePlate,
                              color: const Color(0xFF868FAD),
                              fontSize: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset("assets/images/red_dot.png")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/star_small.png"),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: "${widget.driver.rating}",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: "(${widget.driver.trips}) trips",
                      fontSize: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.chat);
                },
                child: OutlinedContainer(
                  borderRadius: 100,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset("assets/images/chat_icon.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const TextWidget(
                        text: "Chat",
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
              ),
              OutlinedContainer(
                borderRadius: 100,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Image.asset("assets/images/phone.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.payment,
                            arguments: widget.order.id);
                      },
                      child: const TextWidget(
                        text: "Call",
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.showMoreOnTap,
                child: const OutlinedContainer(
                  borderRadius: 200,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [Icon(Icons.expand_more_outlined)],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
