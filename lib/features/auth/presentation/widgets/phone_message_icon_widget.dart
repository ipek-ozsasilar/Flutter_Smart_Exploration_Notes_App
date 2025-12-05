import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class PhoneMessageIconWidget extends StatelessWidget {
  const PhoneMessageIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.loginDoorIconInnerPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients
            .instance
            .phoneVerificationSliderColorfulContainerGradient,
        boxShadow: <BoxShadow>[_boxDecorationMethod()],
      ),
      child: IconWidget(
        icon: AppIcons.instance.sms,
        size: AppSizesIcon.loginDoorIconSize.value,
        color: AppColors.sliderGreen,
      ),
    );
  }

  BoxShadow _boxDecorationMethod() {
    final Color color = AppColors.sliderGreen.withOpacity(0.3);
    final double blurRadius = 20;
    final double spreadRadius = 2;
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}
