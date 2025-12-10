import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class HomeBottomCardWidget extends StatefulWidget {
  const HomeBottomCardWidget({super.key});

  @override
  State<HomeBottomCardWidget> createState() => _HomeBottomCardWidgetState();
}

class _HomeBottomCardWidgetState extends State<HomeBottomCardWidget> {
  // Geçici dummy değerler - ileride gerçek keşif verisi ile beslenecek
  final int _discoveryCount = 0;
  double _goalSliderValue =
      10; // kullanıcı hedef slider değeri (keşif) - min değer ile başlat
  int goalDiscovery = 10; // hedef keşif sayısı
  final MainAxisSize mainAxisSize = MainAxisSize.min;
  final FontWeight fontWeight = FontWeight.w700;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;

  @override
  void initState() {
    super.initState();
    _calculateProgress();
  }

  void _calculateProgress() {
    // Hedefe göre tamamlanma yüzdesi hesapla
    //_discoveryCount suana kadara yapılan toplam keşif sayısı
    //goalDiscovery hedef keşif sayısı
    goalDiscovery = _goalSliderValue.round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.homeBottomCardBackground.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(AppSizesRadius.card.value),
        boxShadow: <BoxShadow>[_homeBottomCardDecoration()],
      ),
      child: Column(
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Row(
            children: <Widget>[
              NormalText(
                label: AppStringsEnum.targetDiscovery.value,
                fontWeight: fontWeight,
              ),
              const Spacer(),
              Container(
                width: AppSizesIcon.homeBottomCardFlagIconSize.value,
                height: AppSizesIcon.homeBottomCardFlagIconSize.value,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: IconWidget(
                  icon: AppIcons.instance.flag,
                  color: AppColors.white,
                  size: AppSizesIcon.flagIconSize.value,
                ),
              ),
            ],
          ),

          Padding(
            padding: AppPaddings.forgotPasswordEmailSentPadding,
            child: _sliderMethod(context),
          ),

          BodyMediumText(
            text: _discoveryCount == 0
                ? AppStringsEnum.homeBottomCardDescription.value
                : AppStringsEnum.homeBottomCardDescriptionContinue.value,
          ),

          Padding(
            padding: AppPaddings.splashCubeFaceTextTopPadding,
            child: SizedBox(
              width: double.infinity,
              child: GeneralElevatedButton(
                text: _discoveryCount == 0
                    ? AppStringsEnum.homeBottomCardButtonText.value
                    : AppStringsEnum.homeBottomCardButtonTextContinue.value,
                formKey: GlobalKey(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliderTheme _sliderMethod(BuildContext context) {
    final int max = 200;
    final int divisions = 19;
    final int min = 0;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 3,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: const Color(0xFF38BDF8),
        inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
      ),
      child: Slider(
        min: min.toDouble(),
        max: max.toDouble(),
        divisions: divisions, // 10,20,...,200
        value: _goalSliderValue,
        label: '$goalDiscovery',
        onChanged: (double value) {
          setState(() {
            _goalSliderValue = value;
            _calculateProgress();
          });
        },
      ),
    );
  }

  BoxShadow _homeBottomCardDecoration() {
    final Color color = Colors.black.withValues(alpha: 0.35);
    final double blurRadius = 30;
    final Offset offset = const Offset(0, 16);
    return BoxShadow(color: color, blurRadius: blurRadius, offset: offset);
  }
}

