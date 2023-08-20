import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InfoSnackBar {
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.verified,
              color: Colors.lightGreen,
              size: 20,
            ),
            Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static SnackBar ticketSnackBar(
    String title,
    String subTitle,
  ) {
    return SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: const Color(
        0xff3FAD57,
      ),
      behavior: SnackBarBehavior.floating,
      content: Transform.translate(
        offset: const Offset(-12, 0),
        child: GestureDetector(
          onTap: () {},
          child: Transform.scale(
            scale: .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0x84D6E0E9),
                  radius: 28,
                  child: Image.asset("assets/images/white_chat.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: title,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: subTitle,
                      color: Colors.white,
                      fontSize: 16,
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset("assets/images/right_chevron.png")
              ],
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xffFCD9D7),
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.asset("assets/images/caution.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 5,
              child: TextWidget(
                text: message,
                color: const Color(0xffbac2f0d0b),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.errorSnackBar(message));
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.successSnackBar(message));
  }

  static void showTicketSnackBar(
      BuildContext context, String title, String subTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      InfoSnackBar.ticketSnackBar(title, subTitle),
    );
  }
}
