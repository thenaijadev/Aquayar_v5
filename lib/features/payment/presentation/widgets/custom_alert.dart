import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/presentation/widgets/login_screen_widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  final String content;
  final Alignment alignment;

  const CustomAlert(
      {super.key, required this.content, this.alignment = Alignment.center});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool formIsSent = false;
  int review = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Align(
                alignment: widget.alignment,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 34.0, horizontal: 20),
                  child: formIsSent
                      ? Container(
                          height: 250,
                          width: 388,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFD6E0E9)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/alert_check.png"),
                                const SizedBox(
                                  height: 24,
                                ),
                                const TextWidget(
                                  text: "Rating submitted",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const SizedBox(
                                  child: Text(
                                    'Thanks for taking your time to rate this driver.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF868FAD),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Container(
                                        width: 211,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFD6E0E9)),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            const TextWidget(
                                              text: "Close",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Image.asset("assets/images/x.png")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: 404,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFD6E0E9)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Column(
                              children: [
                                !formIsSent
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                    "assets/images/x.png")),
                                          ],
                                        ),
                                      )
                                    : const Text(""),
                                const TextWidget(
                                  text: "Rate the driver",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const SizedBox(
                                  child: Text(
                                    'We take your reviews and complaints very seriously.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF868FAD),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    review > 0
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 0;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_filled.png'))
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 1;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_outlined.png')),
                                    review > 1
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 1;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_filled.png'))
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 2;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_outlined.png')),
                                    review > 2
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 2;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_filled.png'))
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 3;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_outlined.png')),
                                    review > 3
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 3;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_filled.png'))
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 4;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_outlined.png')),
                                    review > 4
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 4;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_filled.png'))
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                review = 5;
                                              });
                                            },
                                            child: Image.asset(
                                                'assets/images/star_outlined.png')),
                                  ],
                                ),
                                InputFieldWidget(
                                    enabledBorderRadius: 24,
                                    maxLines: 4,
                                    label: "",
                                    verticalContentPadding: 18,
                                    hintText: "Type a review",
                                    onChanged: (val) {},
                                    textFieldkey: formfieldkey_1),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      formIsSent = true;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: const Color.fromARGB(
                                          255, 0, 170, 255),
                                      child: Container(
                                        width: 211,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFD6E0E9)),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                            ),
                                            TextWidget(
                                              text: "Submit",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 18,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
