import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/slider_colorful_container.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/splash_cubix_animation.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/splash_linear_progress_indicator.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  final double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Opacity(
                opacity: opacity,
                //Slider Colorful Container
                child: SliderColorfulContainer(
                  gradient:
                      AppGradients.instance.splashSliderColorfulContainerGradient,
                ),
              ),

              //Splash Cubix Animation
              Padding(
                padding: AppPaddings.splashCubeAnimationPadding,
                child: SplashCubixAnimation(),
              ),
              //Smart Exploration Notes Text
              HeadlineSmallText( text: AppStringsEnum.smartExplorationNotes.value, fontSize: AppSizesText.headlineSmallFontSize.value),

              //Capture. Label. Rediscover. Text
              Padding(
                padding: AppPaddings.splashLabelRediscoverPadding,
                child: LabelMediumOpacityText(
                  text: AppStringsEnum.captureLabelRediscover.value,
                ),
              ),

              //Splash Linear Progress Indicator
              SplashLinearProgressIndicator(),

              //AI is preparing your discovery space... Text
              Padding(
                padding: AppPaddings.splashAiPreparingPadding,
                child: LabelMediumOpacityText(
                  text: AppStringsEnum.aiDiscoveryPreparing.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
