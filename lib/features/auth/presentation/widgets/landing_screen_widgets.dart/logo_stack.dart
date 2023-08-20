import 'package:aquayar/core/constants/app_colors.dart/app_colors.dart';
import 'package:aquayar/features/auth/presentation/widgets/landing_screen_widgets.dart/logo.dart';
import 'package:flutter/material.dart';

class LogoStack extends StatelessWidget {
  const LogoStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.backgroundGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
          ),
        ),
        const Logo()
      ],
    );
  }
}
