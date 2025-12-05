import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

/// Projenin genel arka plan gradyanları.
class AppGradients {
  AppGradients._();
  static final AppGradients instance = AppGradients._();
  LinearGradient appBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.gradient1,
      AppColors.gradient2,
      AppColors.gradient3,
    ],
  );

  LinearGradient splashSliderColorfulContainerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      AppColors.sliderGreen,
      AppColors.sliderOrange,
      AppColors.sliderBlue,
    ],
  );

  RadialGradient loginViewGradient = RadialGradient(
    colors: <Color>[AppColors.sliderBlue.withOpacity(0.15), Colors.transparent],
  );

  LinearGradient loginSliderColorfulContainerGradient = LinearGradient(
    colors: <Color>[AppColors.sliderBlue, AppColors.sliderGreen],
  );

  LinearGradient loginDoorIconGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.sliderBlue.withOpacity(0.3),
      AppColors.sliderGreen.withOpacity(0.2),
    ],
  );

  LinearGradient forgotPasswordButtonGradient = LinearGradient(
    colors: <Color>[AppColors.sliderOrange, AppColors.cubixRed],
  );

  LinearGradient forgotPasswordIconGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.sliderOrange.withOpacity(0.3),
      AppColors.cubixRed.withOpacity(0.2),
    ],
  );

  SweepGradient homeAnimationSweepGradient = SweepGradient(
    colors: <Color>[
      AppColors.sliderBlue,
      AppColors.sliderGreen,
      AppColors.cubixPurple,
      AppColors.sliderBlue,
    ],
  );

  LinearGradient homeAnimationInnerDotGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[AppColors.darkBackground, AppColors.darkBackground2],
  );

  LinearGradient homeAnimationCenterIconGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.sliderBlue,
      AppColors.sliderBlue.withOpacity(0.7),
      AppColors.sliderGreen.withOpacity(0.3),
    ],
  );
  
}
