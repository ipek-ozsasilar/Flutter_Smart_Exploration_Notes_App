import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
class HomeTopBarWidget extends StatelessWidget {
  const HomeTopBarWidget({required int discoveryCount, super.key})
    : _discoveryCount = discoveryCount;

  final int _discoveryCount;

  @override
  Widget build(BuildContext context) {
    final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    final FontWeight fontWeight = FontWeight.w700;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              HeadlineSmallText(text: AppStringsEnum.discoveries.value, fontSize: AppSizesText.headlineSmallFontSize.value),
              Padding(
                padding: AppPaddings.heroStatCardSubtitlePadding,
                child: BodyMediumText(
                  text: _discoveryCount == 0
                      ? AppStringsEnum.noDiscoveries.value
                      : '$_discoveryCount ${AppStringsEnum.discoveries.value} kaydedildi',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
