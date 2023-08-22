import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/locations/data/providers/address_provider.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:aquayar/features/locations/presentation/widgets/location_tile.dart';

import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({super.key, required this.addresses});
  final List<Address> addresses;
  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  bool isVisible = false;
  int number = 1;
  Address? currentAddress;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
            children: widget.addresses
                .map(
                  (e) => LocationTile(
                    address: SizedBox(
                      width: 250,
                      child: TextWidget(
                        text: e.address,
                        color: const Color(0xFF20254F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: TextWidget(
                      text: widget.addresses.indexOf(e) == 0 ? e.name : e.name,
                      color: widget.addresses.indexOf(e) == 0
                          ? const Color(0xFF623903)
                          : const Color(0xFF85A407),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    image: widget.addresses.indexOf(e) == 0
                        ? Image.asset("assets/images/brown_house.png")
                        : Image.asset("assets/images/green_lamp.png"),
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                        if (widget.addresses.indexOf(e) == 0) {
                          number = 1;
                        } else {
                          number = 2;
                        }
                        currentAddress = e;
                      });
                    },
                  ),
                )
                .toList()),
        Visibility(
          visible: isVisible,
          child: Positioned(
            top: number == 1 ? 80 : 190,
            right: 40,
            child: OutlinedContainer(
              borderRadius: 22,
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 14, bottom: 14, left: 16, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.editLocation,
                          arguments: currentAddress);
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/pen_icon.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const TextWidget(
                          text: "Edit Address",
                          color: Color(0xFF868FAD),
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = false;
                      });
                      Navigator.pushNamed(context, Routes.renameLocation,
                          arguments: currentAddress);
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/note.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const TextWidget(
                          text: "Rename",
                          color: Color(0xFF868FAD),
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      AddressStorage.deleteAddress(address: currentAddress!);
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/trash.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const TextWidget(
                          text: "Delete",
                          color: Color(0xFF868FAD),
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
