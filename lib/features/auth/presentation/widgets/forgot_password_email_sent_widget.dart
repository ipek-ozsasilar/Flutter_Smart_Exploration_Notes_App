import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class ForgotPasswordEmailSentWidget extends StatelessWidget {
  const ForgotPasswordEmailSentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = AppColors.sliderGreen.withOpacity(0.2);
    final double width = 2;
    final Color borderColor = AppColors.sliderGreen.withOpacity(0.5);
    final double blurRadius = AppSizesRadius.button.value;

    return Container(
      padding: AppPaddings.loginDoorIconInnerPadding,
      decoration: BoxDecoration(
        gradient: AppGradients.instance.loginDoorIconGradient,
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        border: Border.all(color: borderColor, width: width),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: width,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: AppPaddings.loginViewGeneralPadding,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: IconWidget(
              icon: AppIcons.instance.checkCircleOutline,
              color: AppColors.sliderGreen,
              size: AppSizesIcon.loginDoorIconSize.value,
            ),
          ),
          Padding(
            padding: AppPaddings.forgotPasswordEmailSentPadding,
            child: HeadlineSmallText(
              text: AppStringsEnum.forgotPasswordEmailSent.value,
            ),
          ),
          BodyMediumText(
            text: AppStringsEnum.forgotPasswordEmailSentDescription.value,
          ),
        ],
      ),
    );
  }
}
