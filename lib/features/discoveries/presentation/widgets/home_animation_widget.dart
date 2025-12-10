import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/constants/app_durations.dart';

class HomeAnimationWidget extends StatelessWidget {
  const HomeAnimationWidget({super.key});

  final Curve curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizesEnum.splashViewCubeOuterSize.value,
      width: AppSizesEnum.splashViewCubeOuterSize.value,
      child: AnimatedContainer(
        duration: AppDurations.instance.homeAnimationDuration,
        curve: curve,
        child: SizedBox(
          width: AppSizesEnum.splashViewCubeSize.value,
          height: AppSizesEnum.splashViewCubeSize.value,
          //AnimatedBuilder, animasyon deÄŸerleri deÄŸiÅŸtiÄŸinde widget aÄŸacÄ±nÄ±n yalnÄ±zca belirli bir bÃ¶lÃ¼mÃ¼nÃ¼ yeniden Ã§izer.
          child: const PulseEffectWidget(),
        ),
      ),
    );
  }
}

class PulseEffectWidget extends StatefulWidget {
  const PulseEffectWidget({super.key});

  @override
  State<PulseEffectWidget> createState() => _PulseEffectWidgetState();
}

class _PulseEffectWidgetState extends State<PulseEffectWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.instance.homeAnimationControllerDuration,
      //repeat() animasyonu dÃ¶ngÃ¼ye alÄ±r ve durdurulana kadar tekrarlar.
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Alignment alignment = Alignment.center;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        //t animasyonun ilerlemesini temsil eder
        final double t = _controller.value;
        //SinÃ¼s fonksiyonu dalga Ã¼retir. t * 2 * math.pi0 dan 2*pi'ye kadar tam bir dalga
        //SinÃ¼s deÄŸerleri: -1.0 ile +1.0 arasÄ± 0.05 * math.sin(...) SinÃ¼s deÄŸerini 0.05 ile Ã§arparÄ±z
        //SonuÃ§: -0.05 ile +0.05 arasÄ± 1'e ekleriz  0.95 ile 1.05 arasÄ± (Ã¶lÃ§ek deÄŸeri)
        //Bu matematiksel iÅŸlem, widget'Ä±n sÃ¼rekli olarak %5 oranÄ±nda bÃ¼yÃ¼yÃ¼p kÃ¼Ã§Ã¼lmesini saÄŸlayarak pulse/nefes alma efektini oluÅŸturur.
        final double pulseScale = 1 + 0.05 * math.sin(t * 2 * math.pi);

        //Transform.scale, widget'Ä± merkez noktasÄ±ndan belirtilen oranda bÃ¼yÃ¼tÃ¼r veya kÃ¼Ã§Ã¼ltÃ¼r.
        // Kodunuzda pulseScale deÄŸeriyle sÃ¼rekli bÃ¼yÃ¼yÃ¼p kÃ¼Ã§Ã¼len bir pulse efekti oluÅŸturuluyor.
        return Transform.scale(
          scale: pulseScale,
          child: Stack(
            alignment: alignment,
            children: <Widget>[
              // DÄ±ÅŸ halka (yumuÅŸak glow)
              Container(
                width: AppSizesEnum.splashViewCubeSize.value,
                height: AppSizesEnum.splashViewCubeSize.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.instance.loginViewGradient,
                ),
              ),

              // DÃ¶nen gradient halka
              Transform.rotate(
                angle: t * 2 * math.pi,
                child: Container(
                  width: AppSizesEnum.splashViewCubeInnerSize.value,
                  height: AppSizesEnum.splashViewCubeInnerSize.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppGradients.instance.homeAnimationSweepGradient,
                  ),
                ),
              ),

              // Ä°Ã§ koyu daire
              Container(
                width: AppSizesEnum.homeAnimationInnerDotSize.value,
                height: AppSizesEnum.homeAnimationInnerDotSize.value,
                decoration: _insideCircleBoxDecorationMethod(),
              ),

              // Merkez pusula ikonu
              Container(
                padding: AppPaddings.loginViewGeneralPadding,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      AppGradients.instance.homeAnimationCenterIconGradient,
                ),
                child: IconWidget(
                  icon: AppIcons.instance.explore,
                  color: AppColors.white,
                  size: AppSizesIcon.homeAnimationCenterIconSize.value,
                ),
              ),

              // KÃ¼Ã§Ã¼k dÃ¶nen noktalar (marker hissi)
              _buildOrbitDot(
                angle: t * 2 * math.pi,
                radius: AppSizesRadius.homeAnimationOrbitDotRadius.value,
              ),
              _buildOrbitDot(
                angle: t * 2 * math.pi + 2,
                radius: AppSizesRadius.homeAnimationOrbitDotRadius2.value,
              ),
              _buildOrbitDot(
                angle: t * 2 * math.pi + 4,
                radius: AppSizesRadius.homeAnimationOrbitDotRadius3.value,
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _insideCircleBoxDecorationMethod() {
    final Offset offset = Offset(0, AppSizesRadius.cube.value);
    final Color color = AppColors.black.withValues(alpha: 0.35);
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: AppGradients.instance.homeAnimationInnerDotGradient,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: color,
          blurRadius: AppSizesRadius.cube.value,
          offset: offset,
        ),
      ],
    );
  }

  Widget _buildOrbitDot({required double angle, required double radius}) {
    return Transform.translate(
      offset: Offset(radius * math.cos(angle), radius * math.sin(angle)),
      child: Container(
        width: AppSizesEnum.homeAnimationOrbitDotSize.value,
        height: AppSizesEnum.homeAnimationOrbitDotSize.value,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.85),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
