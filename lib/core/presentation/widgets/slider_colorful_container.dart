import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';

class SliderColorfulContainer extends StatelessWidget {
  const SliderColorfulContainer({super.key, required this.gradient});
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizesEnum.sliderColorfulContainerHeight.value,
      margin: AppPaddings.sliderColorfulContainerMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizesRadius.full.value),
        gradient: gradient,
      ),
    );
  }
}
