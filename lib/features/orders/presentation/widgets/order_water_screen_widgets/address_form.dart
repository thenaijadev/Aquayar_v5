import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:aquayar/features/orders/data/models/address.dart';
import 'package:aquayar/features/orders/data/models/address_box.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddressForm extends StatefulWidget {
  const AddressForm(
      {super.key,
      this.onTap,
      this.labelFontWeight = FontWeight.normal,
      required this.labelFontSize,
      required this.onChanged,
      required this.formfieldkey,
      required this.controller});
  final void Function()? onTap;
  final FontWeight labelFontWeight;
  final double labelFontSize;
  final GlobalKey<FormFieldState> formfieldkey;
  final TextEditingController controller;
  final void Function(String?) onChanged;
  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InputFieldWidget(
              controller: widget.controller,
              labelFontSize: widget.labelFontSize,
              onTap: widget.onTap,
              fontWeight: widget.labelFontWeight,
              verticalContentPadding: 0,
              suffixIcon: widget.controller.text != ""
                  ? GestureDetector(
                      onTap: () => widget.controller.text = "",
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset("assets/images/x_circle.png"),
                      ),
                    )
                  : const Text(""),
              label: "Deliver to",
              hintText: "Enter Address",
              onChanged: widget.onChanged,
              textFieldkey: widget.formfieldkey),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  width: 170,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                        width: 1,
                        color: isHome
                            ? const Color(0xff623903)
                            : const Color(0xff868FAE),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: Boxes.getAddresses().listenable(),
                            builder: (context, box, _) {
                              final addresses =
                                  box.values.toList().cast<Address>();
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHome = true;
                                  });
                                  widget.controller.text = addresses[0].address;
                                },
                                child: SizedBox(
                                  width: 78,
                                  child: TextWidget(
                                    overflow: TextOverflow.ellipsis,
                                    text: addresses.length < 2
                                        ? addresses.length == 1
                                            ? addresses[0].name
                                            : "Home"
                                        : addresses[0].name,
                                    fontSize: 14,
                                    color: isHome
                                        ? const Color(0xff623903)
                                        : const Color(0xff868FAE),
                                  ),
                                ),
                              );
                            }),
                        isHome ? const Icon(Icons.check) : const Text(""),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  width: 170,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                        width: 1,
                        color: !isHome
                            ? const Color(0xff623903)
                            : const Color(0xff868FAE),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: Boxes.getAddresses().listenable(),
                            builder: (context, box, _) {
                              final addresses =
                                  box.values.toList().cast<Address>();
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHome = false;
                                  });
                                  widget.controller.text = addresses[1].address;
                                },
                                child: SizedBox(
                                  width: 78,
                                  child: TextWidget(
                                    overflow: TextOverflow.ellipsis,
                                    text: addresses.length < 2
                                        ? "Work"
                                        : addresses[1].name,
                                    fontSize: 14,
                                    color: !isHome
                                        ? const Color(0xff623903)
                                        : const Color(0xff868FAE),
                                  ),
                                ),
                              );
                            }),
                        !isHome ? const Icon(Icons.check) : const Text(""),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedContainer(
                padding: const EdgeInsets.all(10),
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.locations);
                },
                child: Image.asset("assets/images/pen_icon.png"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
