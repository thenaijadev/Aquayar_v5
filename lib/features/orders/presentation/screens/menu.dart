import 'dart:io';

import 'package:aquayar/config/router/routes.dart';
import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/circle_avatar_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:aquayar/features/orders/presentation/widgets/menu_widgets/horizontal_rule_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/menu_widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _restartApp() {
    // Exit the app
    exit(0);
  }

  bool light = true;
  @override
  Widget build(BuildContext context) {
    final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/images/menu_x.png"),
        ),
        title: Container(
          width: 181,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.inputBorder),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F030D45),
                blurRadius: 24,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/location_pin.png"),
              const SizedBox(
                width: 6,
              ),
              const TextWidget(
                text: "Enugu, Nigeria",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: Row(
                  children: [
                    const CircleAvatarWidget(
                      image: "assets/images/head.png",
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: user.displayName!,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: user.email!,
                              color: const Color(0xFF868FAD),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset("assets/images/tick_circle.png")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29, bottom: 4),
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment(0.63, -0.78),
                      end: Alignment(-0.63, 0.78),
                      colors: [Color(0xFF6F6CF8), Color(0xFF4725F7)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24),
                    child: Row(
                      children: [
                        Image.asset("assets/images/star_small.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Completed Orders",
                              color: Colors.white,
                            ),
                            Flexible(
                              child: TextWidget(
                                  text: "12",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(width: 70),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Beginner",
                              color: Colors.white,
                            ),
                            Flexible(
                              child: TextWidget(
                                text: "Level 1",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(
                    text: "Next in: 3",
                    color: Color(0xFF868FAD),
                  ),
                  TextWidget(
                    text: "Next in: 3",
                    color: Color(0xFF868FAD),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      MenuItemWidget(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.editProfile,
                            );
                          },
                          image: "assets/images/user_icon.png",
                          label: "Edit Profile"),
                      const HorizontalRuleWidget(),
                      MenuItemWidget(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.changePassword,
                            );
                          },
                          image: "assets/images/key_icon.png",
                          label: "Change Password"),
                      const HorizontalRuleWidget(),
                      MenuItemWidget(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.waterTank);
                          },
                          image: "assets/images/bubble.png",
                          label: "Your Water Tank"),
                      const HorizontalRuleWidget(),
                      MenuItemWidget(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.locations);
                          },
                          image: "assets/images/routing.png",
                          label: "Your Locations"),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/moon.png"),
                                const SizedBox(
                                  width: 12,
                                ),
                                const TextWidget(
                                  text: "Dark Theme",
                                  color: Color(0xFF868FAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              width: 38,
                              child: FlutterSwitch(
                                width: 125.0,
                                height: 55.0,
                                valueFontSize: 25.0,
                                toggleSize: 13.0,
                                inactiveColor: Colors.white,
                                inactiveSwitchBorder: Border.all(
                                  color: const Color(0xFF868FAD),
                                ),
                                toggleBorder: Border.all(
                                    color: const Color(0xFF868FAD), width: 9),
                                value: light,
                                borderRadius: 10.0,
                                padding: 2.0,
                                onToggle: (val) {
                                  setState(() {
                                    light = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      MenuItemWidget(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.helpAndSupport);
                          },
                          image: "assets/images/chat.png",
                          label: "Help & Support"),
                      const HorizontalRuleWidget(),
                      MenuItemWidget(
                          onTap: () {},
                          image: "assets/images/message.png",
                          label: "Give Feedback"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.deleteAccount),
                  child: OutlinedContainer(
                    borderRadius: 24,
                    color: const Color(0xFFFAFAFA),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/bin.png"),
                              const SizedBox(
                                width: 12,
                              ),
                              const TextWidget(
                                text: "Delete Account",
                                color: Color(0xFFC0362C),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Image.asset("assets/images/chevron_right.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: OutlinedContainer(
                  onTap: () async {
                    final box = AquayarBox.getAquayarUser();
                    await box.clear();
                    _restartApp();
                  },
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "Logout",
                          color: Color(0xFFC0362C),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
