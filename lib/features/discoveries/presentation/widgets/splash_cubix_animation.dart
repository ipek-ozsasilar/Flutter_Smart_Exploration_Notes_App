import 'package:cubixd/cubixd.dart';
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class SplashCubixAnimation extends StatelessWidget {
  const SplashCubixAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizesEnum.splashViewCubeOuterSize.value,
      width: AppSizesEnum.splashViewCubeOuterSize.value,
      child: AnimatedCubixD(
        size: AppSizesEnum.splashViewCubeSize.value,
        onSelected: (_) => true,
        //küpün yüzlerine çzilen kartlar mesela front ön yüzü
        front: _SplashCubeFace(
          icon: AppIcons.map,
          color: AppColors.sliderGreen,
          label: AppStringsEnum.map.value,
        ),
        back: _SplashCubeFace(
          icon: AppIcons.capture,
          color: AppColors.sliderBlue,
          label: AppStringsEnum.capture.value,
        ),
        left: _SplashCubeFace(
          icon: AppIcons.labels,
          color: AppColors.sliderOrange,
          label: AppStringsEnum.labels.value,
        ),
        right: _SplashCubeFace(
          icon: AppIcons.notify,
          color: AppColors.cubixRed,
          label: AppStringsEnum.notify.value,
        ),
        top: _SplashCubeFace(
          icon: AppIcons.ai,
          color: AppColors.cubixPurple,
          label: AppStringsEnum.ai.value,
        ),
        bottom: _SplashCubeFace(
          icon: AppIcons.notes,
          color: AppColors.cubixBlue,
          label: AppStringsEnum.notes.value,
        ),
      ),
    );
  }
}

class _SplashCubeFace extends StatelessWidget {
  const _SplashCubeFace({
    required this.icon,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final Color color;
  final String label;
  final double aspectRatio = 1;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final Offset offset = const Offset(0, 8);
  final FontWeight fontWeight = FontWeight.w600;

  LinearGradient CubeLinearGradient(Color color) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[color.withOpacity(0.95), color.withOpacity(0.7)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizesRadius.cube.value),
          gradient: CubeLinearGradient(color),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: AppSizesRadius.button.value,
              offset: offset,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            IconWidget(
              icon: icon,
              color: AppColors.white,
              size: AppSizesIcon.splashCubixAnimationIcon.value,
            ),
            Padding(
              padding: AppPaddings.splashCubeFaceTextTopPadding,
              child: NormalText(label: label, fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
