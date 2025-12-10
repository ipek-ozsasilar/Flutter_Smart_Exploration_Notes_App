import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';

class CategoryGroup {
  const CategoryGroup({
    required this.title,
    required this.color,
    required this.count,
    required this.description,
  });

  final String title;
  final Color color;
  final int count;
  final String description;
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.group, super.key});

  final CategoryGroup group;
  final double borderWidth = 1.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.categoryCardMargin,
      padding: AppPaddings.categoryCardPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        gradient: _categoryOutLinearGradientMethod(),
        border: Border.all(
          color: group.color.withValues(alpha: 0.6),
          width: borderWidth,
        ),
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: _categoryItems(context),
    );
  }

  Row _categoryItems(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    final Color color = AppColors.white.withValues(alpha: 0.8);
    final CrossAxisAlignment crossAxisAlignmentEnd = CrossAxisAlignment.end;

    return Row(
      children: <Widget>[
        Container(
          width: AppSizesIcon.categoryCardIconContainerSize.value,
          height: AppSizesIcon.categoryCardIconContainerSize.value,
          decoration: _boxShadowMethodInner(),
          child: IconWidget(
            icon: AppIcons.instance.label,
            color: AppColors.white,
            size: AppSizesIcon.categoryCardIconSize.value,
          ),
        ),
        Padding(padding: AppPaddings.categoryCardIconSpacing),
        Expanded(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              NormalText(label: group.title, fontWeight: FontWeight.w700),
              Padding(
                padding: AppPaddings.categoryCardTextSpacing,
                child: BodyMediumText(text: group.description, textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: crossAxisAlignmentEnd,
          children: <Widget>[
            Container(
              padding: AppPaddings.categoryCardCountPadding,
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(AppSizesRadius.full.value),
              ),
              child: LabelMediumOpacityText(text: '${group.count} discoveries'),
            ),
            Padding(
              padding: AppPaddings.categoryCardArrowSpacing,
              child: IconWidget(
                icon: AppIcons.instance.arrowForwardIosRounded,
                color: color,
                size: AppSizesIcon.categoryCardArrowIconSize.value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  LinearGradient _categoryOutLinearGradientMethod() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        group.color.withValues(alpha: 0.22),
        AppColors.black.withValues(alpha: 0.5),
      ],
    );
  }

  BoxShadow _boxShadowMethod() {
    final double blurRadius = 22;
    final Offset offset = const Offset(0, 10);
    return BoxShadow(
      color: group.color.withValues(alpha: 0.45),
      blurRadius: blurRadius,
      offset: offset,
    );
  }

  BoxDecoration _boxShadowMethodInner() {
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[group.color, group.color.withValues(alpha: 0.7)],
      ),
    );
  }
}

