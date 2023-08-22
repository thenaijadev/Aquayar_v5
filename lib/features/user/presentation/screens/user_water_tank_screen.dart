import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:aquayar/features/user/presentation/widgets/rounded_progress_painter.dart';
import 'package:aquayar/features/user/presentation/widgets/water_tank.dart';
import 'package:flutter/material.dart';

class WaterTankScreeen extends StatefulWidget {
  const WaterTankScreeen({super.key});

  @override
  State<WaterTankScreeen> createState() => _WaterTankScreeenState();
}

class _WaterTankScreeenState extends State<WaterTankScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Your Water Tank",
            color: Color(0xFF20254F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Transform.scale(
                scale: 1.5,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 205,
                      width: 205,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200)),
                    ),
                    SizedBox(
                      height: 109,
                      width: 132,
                      child: CustomPaint(
                        painter: RoundedProgressPainter(
                            backgroundColor: const Color(0xffF2F2F2),
                            valueColor: const Color(0xFF98D5F3),
                            strokeWidth: 10,
                            value: 50 // Replace with your desired value
                            ),
                      ),
                    ),
                    const WaterTank(
                      number: 80,
                    ),
                    const Positioned(
                      bottom: 60,
                      child: Column(
                        children: [
                          TextWidget(
                            text: "200",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          TextWidget(
                            text: "Litres",
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 132,
                      left: 95,
                      child: Container(
                        width: 110,
                        height: 43,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x33030D45),
                                  offset: Offset(0, 9),
                                  spreadRadius: 1,
                                  blurRadius: 22)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const TextWidget(
                                    text: "Last refill",
                                    color: Color(0xFF868FAD),
                                    fontSize: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 2.5,
                                    width: 22,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFF7A00),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                      scale: .55,
                                      child: Image.asset(
                                          "assets/images/drop_cracked.png")),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const TextWidget(
                                    text: "200L",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const TextWidget(
                                    text: "42%",
                                    color: Color(0xFF868FAD),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                shadowColor: const Color.fromARGB(255, 0, 170, 255),
                child: Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD6E0E9)),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      TextWidget(
                        text: "Edit Tank Size",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 13),
            child: TextWidget(
              text: "Water Level",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16),
            child: SizedBox(
              width: 396,
              height: 60,
              child: OutlinedContainer(
                  borderRadius: 100,
                  color: Color(0xFFFAFAFA),
                  child: Center(child: TextWidget(text: "No data available"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: OutlinedContainer(
              padding: const EdgeInsets.only(left: 21, right: 21, top: 19),
              borderRadius: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text:
                        'Get live feedback about the status of the water level in your water tank by installing an Aquayar Chip.',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      shadowColor: const Color.fromARGB(255, 0, 170, 255),
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD6E0E9)),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 26,
                            ),
                            TextWidget(
                              text: "Pre-order chip",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
