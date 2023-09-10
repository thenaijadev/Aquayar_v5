import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/help&Support/presentation/widgets/horizontal_line.dart';
import 'package:aquayar/features/orders/data/models/order_model.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';

import 'package:flutter/material.dart';

class DirectionMapScreenMore extends StatefulWidget {
  const DirectionMapScreenMore(
      {super.key,
      required this.showLessOnMap,
      required this.data,
      required this.order});
  final void Function() showLessOnMap;
  final Map<String, dynamic> data;
  final OrderModel order;

  @override
  State<DirectionMapScreenMore> createState() => _DirectionMapScreenMoreState();
}

class _DirectionMapScreenMoreState extends State<DirectionMapScreenMore> {
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

    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        OutlinedContainer(
          borderRadius: 24,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/timer.png"),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextWidget(
                        text: "Est. Time",
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      ),
                      TextWidget(
                          text: widget.data["time"].contains("hour") ||
                                  widget.data["time"].contains("hours")
                              ? formatTime(widget.data["time"])
                              : widget.data["time"],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/driving.png"),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextWidget(
                        text: "Distance",
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      ),
                      TextWidget(
                          text:
                              "${(widget.data["distance"] / 1000).toStringAsFixed(1)}KM",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/drop.png"),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextWidget(
                        text: "Liters",
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      ),
                      const TextWidget(
                          text: "500",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              ),

              // Row(children: [
              //   Column(children: [
              //     const CircleAvatar(
              //         radius: 12,
              //         backgroundColor: Color(0xFFF0F0F0),
              //         child: CircleAvatar(
              //             radius: 5, backgroundColor: Color(0xFFADAFC2))),
              //     const SizedBox(
              //       height: 5.5,
              //     ),
              //     Image.asset("assets/images/v_line.png"),
              //     const SizedBox(
              //       height: 5.5,
              //     ),
              //     const CircleAvatar(
              //         radius: 12,
              //         backgroundColor: Color.fromARGB(94, 63, 173, 87),
              //         child: CircleAvatar(
              //           radius: 5,
              //           backgroundColor: Color(0xFF3FAD57),
              //         )),
              //   ]),
              //   const SizedBox(width: 30),
              //   const Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         OutlinedContainer(
              //             borderRadius: 100,
              //             padding: EdgeInsets.only(
              //                 top: 5, bottom: 5, left: 16, right: 16),
              //             child: TextWidget(
              //                 text: "34 Sir Ken Nnamdi Drive",
              //                 fontSize: 16,
              //                 color: Color(0xff868FAE))),
              //         SizedBox(height: 18),
              //         OutlinedContainer(
              //             borderRadius: 100,
              //             padding: EdgeInsets.only(
              //                 top: 5, bottom: 5, left: 16, right: 16),
              //             child: TextWidget(
              //                 text: "WTC Estate",
              //                 fontSize: 16,
              //                 color: Color(0xff868FAE)))
              //       ])
              // ]),
              const SizedBox(
                height: 20,
              ),
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
                        text: 'Amount',
                        color: Color(0xFF868FAD),
                        fontSize: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: formatNumberWithCommas(widget.data["price"]),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          const SizedBox(width: 10),
                          const TextWidget(
                            text: '(Confirmed after scarcity check)',
                            color: Color(0xFF868FAD),
                            fontSize: 10.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const HorizontalLineWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: Row(
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
                        const TextWidget(
                          text: "Henry Immanuel",
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
                            const TextWidget(
                              text: 'ABJ-567-EA',
                              color: Color(0xFF868FAD),
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
                    const SizedBox(
                      width: 70,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/star_small.png"),
                            const SizedBox(width: 5),
                            const TextWidget(
                              text: "4.3",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const TextWidget(
                          text: "(246) trips",
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
                        const TextWidget(
                          text: "Call",
                          fontSize: 14,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLessOnMap,
                    child: OutlinedContainer(
                        borderRadius: 200,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/x.png")),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 0,
        ),
      ],
    );
  }
}
