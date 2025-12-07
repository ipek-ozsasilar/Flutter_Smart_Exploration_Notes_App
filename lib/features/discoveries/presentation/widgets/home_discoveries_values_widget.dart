import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class HomeDiscoveriesValuesWidget extends StatelessWidget {
  const HomeDiscoveriesValuesWidget({
    super.key,
    required double progress,
    required this.goalDiscovery,
    required int discoveryCount,
  }) : _progress = progress,
       _discoveryCount = discoveryCount;

  final double _progress;
  final int goalDiscovery;
  final int _discoveryCount;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.end;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        HeadlineSmallText(text: '${(_progress * 100).round()}%'.toString(), fontSize: AppSizesText.headlineSmallFontSize.value),

        Padding(
          padding: AppPaddings.homeDiscoveriesValuesInsidePadding,
          child: BodyMediumText(text: AppStringsEnum.completed.value),
        ),

        HeadlineSmallText(text: '$goalDiscovery', fontSize: AppSizesText.headlineSmallFontSize.value),

        Padding(
          padding: AppPaddings.homeDiscoveriesValuesInsidePadding,
          child: BodyMediumText(text: AppStringsEnum.targetDiscovery.value),
        ),

        HeadlineSmallText(text: _discoveryCount.toString(), fontSize: AppSizesText.headlineSmallFontSize.value),

        Padding(
          padding: AppPaddings.heroStatCardSubtitlePadding,
          child: BodyMediumText(
            text: _discoveryCount == 0
                ? AppStringsEnum.noDiscoveries.value
                : AppStringsEnum.discoveries.value,
          ),
        ),
      ],
    );
  }
}
