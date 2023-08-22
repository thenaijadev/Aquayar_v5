import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/locations/data/models/address_box.dart';
import 'package:aquayar/features/locations/presentation/widgets/add_location_form.dart';
import 'package:aquayar/features/locations/presentation/widgets/locations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
          text: "Your Locations",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleBlack,
            size: 25,
          ),
        ),
      ),
      body: Stack(children: [
        ValueListenableBuilder(
            valueListenable: Boxes.getAddresses().listenable(),
            builder: (context, box, _) {
              final addresses = box.values.toList().cast<Address>();
              return addresses.isEmpty
                  ? const AddLocationForm()
                  : Locations(
                      addresses: addresses,
                    );
            }),
      ]),
    );
  }
}
