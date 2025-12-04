import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class SplashLinearProgressIndicator extends StatelessWidget {
  SplashLinearProgressIndicator({super.key});
  final Color backgroundColor = AppColors.white.withOpacity(0.25);
  final double minHeight = 3;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizesEnum.splashViewCubeSize.value,
      child: LinearProgressIndicator(
        backgroundColor: backgroundColor,
        color: AppColors.indicatorColor,
        minHeight: minHeight,
        borderRadius: BorderRadius.circular(AppSizesRadius.full.value),
      ),
    );
  }
}
