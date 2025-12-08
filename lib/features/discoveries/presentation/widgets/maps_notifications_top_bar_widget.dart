import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class MapsNotificationsTopBarWidget extends StatelessWidget {
  const MapsNotificationsTopBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GeneralIconButton(
          icon: AppIcons.instance.arrowBack,
          onPressed: () => Navigator.of(context).pop(),
          color: AppColors.white,
        ),
        Expanded(
          child: Center(
            child: HeadlineSmallText(
              text: title,
              fontSize: AppSizesText.headlineSmallFontSize.value,
            ),
          ),
        ),
      ],
    );
  }
}
