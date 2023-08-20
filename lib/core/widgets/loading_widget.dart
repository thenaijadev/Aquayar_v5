import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: SpinKitSpinningLines(
          color: Color.fromARGB(255, 4, 136, 231),
          size: 40.0,
        ),
      ),
    );
  }
}
