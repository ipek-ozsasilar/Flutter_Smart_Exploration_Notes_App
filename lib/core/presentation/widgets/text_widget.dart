import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class NormalText extends StatelessWidget {
  const NormalText({super.key, required this.label, required this.fontWeight});

  final String label;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: AppColors.white, fontWeight: fontWeight),
    );
  }
}

class LabelMediumOpacityText extends StatelessWidget {
  LabelMediumOpacityText({super.key, required this.text});
  final String text;
  final TextAlign textAlign = TextAlign.center;
  final Color color = AppColors.white.withOpacity(0.85);
  final FontWeight fontWeight = FontWeight.w500;
  final double letterSpacing = 0.3;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  const HeadlineSmallText({super.key});
  final double letterSpacing = 0.5;
  final TextAlign textAlign = TextAlign.center;
  final FontWeight fontWeight = FontWeight.w700;
  @override
  Widget build(BuildContext context) {
    return Text(
      AppStringsEnum.smartExplorationNotes.value,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: AppColors.white,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
