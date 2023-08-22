import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  const LocationTile(
      {super.key,
      required this.onTap,
      required this.image,
      required this.label,
      required this.address});
  final VoidCallback onTap;
  final Widget image;
  final Widget label;
  final Widget address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
        left: 18,
        right: 18,
      ),
      child: OutlinedContainer(
        onTap: () {},
        borderRadius: 22,
        padding:
            const EdgeInsets.only(left: 24, bottom: 16, top: 16, right: 21),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  image,
                  const SizedBox(
                    width: 10,
                  ),
                  label,
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              address,
            ],
          ),
          GestureDetector(
              onTap: onTap, child: Image.asset("assets/images/menu.png"))
        ]),
      ),
    );
  }
}
