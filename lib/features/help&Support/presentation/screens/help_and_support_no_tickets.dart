import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/orders/presentation/widgets/home_widgets/outlined_container.dart';
import 'package:flutter/material.dart';

class HelpSupportTickets extends StatefulWidget {
  const HelpSupportTickets({super.key});

  @override
  State<HelpSupportTickets> createState() => _HelpSupportTicketsState();
}

class _HelpSupportTicketsState extends State<HelpSupportTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Help & Support",
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
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 20),
          child: Row(
            children: [
              TextWidget(
                text: "Tickets",
                color: Color(0xFF20254F),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Center(child: Image.asset("assets/images/no_tickets.png")),
        const TextWidget(
          text: "No open tickets",
          fontSize: 18,
        ),
        const SizedBox(
          height: 33,
        ),
        Transform.translate(
          offset: const Offset(9, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -6),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: OutlinedContainer(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    borderRadius: 100,
                    child: TextWidget(text: "No ,thank you"),
                  ),
                ),
              ),
              Image.asset("assets/images/chat_with_us.png", width: 200)
            ],
          ),
        )
      ]),
    );
  }
}
