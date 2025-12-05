import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_durations.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class HomeAnimationWidget extends StatelessWidget {
  const HomeAnimationWidget({super.key});

  final Curve curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizesEnum.splashViewCubeOuterSize.value,
      width: AppSizesEnum.splashViewCubeOuterSize.value,
      child: AnimatedContainer(
        duration: AppDurations.HomeAnimationDuration,
        curve: curve,
        child: SizedBox(
          width: AppSizesEnum.splashViewCubeSize.value,
          height: AppSizesEnum.splashViewCubeSize.value,
          //AnimatedBuilder, animasyon değerleri değiştiğinde widget ağacının yalnızca belirli bir bölümünü yeniden çizer.
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
      duration: AppDurations.HomeAnimationControllerDuration,
      //repeat() animasyonu döngüye alır ve durdurulana kadar tekrarlar.
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
        //Sinüs fonksiyonu dalga üretir. t * 2 * math.pi0 dan 2*pi'ye kadar tam bir dalga
        //Sinüs değerleri: -1.0 ile +1.0 arası 0.05 * math.sin(...) Sinüs değerini 0.05 ile çarparız
        //Sonuç: -0.05 ile +0.05 arası 1'e ekleriz  0.95 ile 1.05 arası (ölçek değeri)
        //Bu matematiksel işlem, widget'ın sürekli olarak %5 oranında büyüyüp küçülmesini sağlayarak pulse/nefes alma efektini oluşturur.
        final double pulseScale = 1 + 0.05 * math.sin(t * 2 * math.pi);

        //Transform.scale, widget'ı merkez noktasından belirtilen oranda büyütür veya küçültür.
        // Kodunuzda pulseScale değeriyle sürekli büyüyüp küçülen bir pulse efekti oluşturuluyor.
        return Transform.scale(
          scale: pulseScale,
          child: Stack(
            alignment: alignment,
            children: <Widget>[
              // Dış halka (yumuşak glow)
              Container(
                width: AppSizesEnum.splashViewCubeSize.value,
                height: AppSizesEnum.splashViewCubeSize.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.instance.loginViewGradient,
                ),
              ),

              // Dönen gradient halka
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

              // İç koyu daire
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

              // Küçük dönen noktalar (marker hissi)
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
    final Color color = AppColors.black.withOpacity(0.35);
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
          color: AppColors.white.withOpacity(0.85),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
