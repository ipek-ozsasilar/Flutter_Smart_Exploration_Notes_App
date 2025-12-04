import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class LoginDoorWidget extends StatelessWidget {
  LoginDoorWidget({super.key});
  final double spreadRadius = 2;
  final Color color = AppColors.sliderBlue.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.loginDoorIconInnerPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.instance.loginDoorIconGradient,
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: IconWidget(
        icon: AppIcons.loginDoor,
        size: AppSizesIcon.loginDoorIconSize.value,
        color: AppColors.sliderBlue,
      ),
    );
  }

  BoxShadow _boxShadowMethod() {
    return BoxShadow(
      color: color,
      blurRadius: AppSizesRadius.cube.value,
      spreadRadius: spreadRadius,
    );
  }
}
