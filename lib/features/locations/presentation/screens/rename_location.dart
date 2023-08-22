import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/locations/data/models/address.dart';
import 'package:aquayar/features/locations/data/providers/address_provider.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';

import 'package:flutter/material.dart';

class RenameLocation extends StatefulWidget {
  const RenameLocation({super.key, required this.address});
  final Address address;
  @override
  State<RenameLocation> createState() => _RenameLocationState();
}

class _RenameLocationState extends State<RenameLocation> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18,
              right: 18,
            ),
            child: OutlinedContainer(
              borderRadius: 22,
              padding: const EdgeInsets.only(
                  left: 24, bottom: 16, top: 16, right: 21),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/left_arrow.png"),
                        Row(
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.asset("assets/images/note.png")),
                            const SizedBox(width: 5),
                            const TextWidget(
                              text: "Renaming Address",
                              fontSize: 16,
                              color: Color(0xff868FAE),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: AppColors.inputBorder,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Transform.translate(
                          offset: const Offset(0, -3),
                          child: TextFormField(
                            key: formfieldkey_1,
                            cursorColor: AppColors.inputBorder,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                suffix: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Transform.translate(
                                    offset: const Offset(0, 3),
                                    child: Transform.scale(
                                        scale: 1.3,
                                        child: Image.asset(
                                            "assets/images/x_circle.png")),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await AddressStorage.editName(
                            name: formfieldkey_1.currentState?.value,
                            address: widget.address);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Transform.scale(
                            scale: 1.25,
                            child: Image.asset("assets/images/save_blue.png")),
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
