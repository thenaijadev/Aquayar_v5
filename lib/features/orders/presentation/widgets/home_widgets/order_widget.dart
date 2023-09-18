import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/circle_avatar_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/order.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/show_promotion_sheet.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/tab_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.orders});

  final List orders;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    getAddress(widget.orders);
  }

  List<String> addresses = [];
  getAddress(orders) async {
    for (var order in orders) {
      final address = await LocationProvider().getAddressFromCorrdinates(
          '${order["customer"]["coordinates"][1]},${order["customer"]["coordinates"][0]}');
      addresses.add(address!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.menu,
                );
              },
              child: const CircleAvatarWidget(
                image: "assets/images/head.png",
              ),
            ),
            const CircleAvatarWidget(
              image: "assets/images/bell.png",
            )
          ],
        ),
        const TextWidget(
          text: "Good Morning,",
          fontSize: 32,
        ),
        TextWidget(
          text: user.displayName!,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            showPromotionBottomSheet(context);
          },
          child: Container(
            width: 340,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.waterTank);
                },
                label: "Your Water Tank"),
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.locations);
                },
                label: "Your Locations")
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {}, child: Image.asset("assets/images/search.png")),
              const TextWidget(
                text: "Orders",
                fontSize: 16,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset("assets/images/calender.png")),
            ],
          ),
        ),
        const SizedBox(height: 12),
        isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SpinKitSpinningLines(
                  color: Color.fromARGB(255, 4, 136, 231),
                  size: 40.0,
                ),
              )
            : SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: widget.orders.length,
                  itemBuilder: (context, index) {
                    return Order(
                      order: widget.orders[index],

                      //TODO:NOTE
                      address: addresses[index],
                    );
                  },
                  // children: const [
                  //   Order(
                  //     image: "assets/images/order_icon.png",
                  //   ),
                  //   Order(
                  //     image: "assets/images/completed_order_icon.png",
                  //   ),
                  //   Order(
                  //     image: "assets/images/cancelled_order.png",
                  //   )
                  // ],
                ),
              )
      ],
    );
  }
}
