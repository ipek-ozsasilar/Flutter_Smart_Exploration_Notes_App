import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class ForgotResetIconWidget extends StatelessWidget {
  const ForgotResetIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.loginDoorIconInnerPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.instance.forgotPasswordIconGradient,
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: IconWidget(
        icon: AppIcons.instance.lockReset,
        color: AppColors.sliderOrange,
        size: AppSizesIcon.loginDoorIconSize.value,
      ),
    );
  }

  BoxShadow _boxShadowMethod() {
    final Color color = AppColors.sliderOrange.withValues(alpha: 0.3);
    final double spreadRadius = 2;
    return BoxShadow(
      color: color,
      blurRadius: AppSizesRadius.button.value,
      spreadRadius: spreadRadius,
    );
  }
}

