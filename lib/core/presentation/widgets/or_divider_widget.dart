import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _DividerMethod(),
        Padding(
          padding: AppPaddings.orDividerPadding,
          child: BodyMediumText(text: AppStringsEnum.or.value)
        ),
        _DividerMethod(),
      ],
    );
  }

  Expanded _DividerMethod() {
    return Expanded(
        child: Divider(color: AppColors.white.withOpacity(0.3), thickness: 1),
      );
  }
}