import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/help&Support/presentation/widgets/horizontal_line.dart';
import 'package:flutter/material.dart';

class DeleteCheckItems extends StatefulWidget {
  const DeleteCheckItems({super.key});

  @override
  State<DeleteCheckItems> createState() => _DeleteCheckItemsState();
}

bool? isChecked = false;

class _DeleteCheckItemsState extends State<DeleteCheckItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                      side: const BorderSide(width: 1, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = val;
                        });
                      }),
                  const TextWidget(text: "Lorem"),
                ],
              ),
              const HorizontalLineWidget()
            ],
          ),
        ),
      ],
    );
  }
}
