import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/locations/data/providers/address_provider.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';

import 'package:flutter/material.dart';

class AddLocationForm extends StatefulWidget {
  const AddLocationForm({super.key});

  @override
  State<AddLocationForm> createState() => _AddLocationFormState();
}

class _AddLocationFormState extends State<AddLocationForm> {
  String home = "";
  String alt = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 18,
            right: 18,
          ),
          child: OutlinedContainer(
            borderRadius: 22,
            padding:
                const EdgeInsets.only(left: 24, bottom: 16, top: 16, right: 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("assets/images/note.png")),
                        const SizedBox(width: 5),
                        const TextWidget(
                          text: "Add Home Address",
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
                        onChanged: (val) {
                          home = val;
                        },
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/note.png")),
                    const SizedBox(width: 5),
                    const TextWidget(
                      text: "Add Alternative Address",
                      fontSize: 16,
                      color: Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 100,
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
                        onChanged: (val) {
                          alt = val;
                        },
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
                    await AddressStorage.addAddress(address: home);
                    await AddressStorage.addAddress(address: alt);
                    setState(() {});
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    child: Transform.scale(
                        scale: 1.25,
                        child: Image.asset("assets/images/save_blue.png")),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
