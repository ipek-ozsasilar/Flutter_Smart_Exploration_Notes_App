import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

/// Auth ve diğer ekranlarda kullanılan küçük bilgi kartı.
class HeroStatCard extends StatelessWidget {
  HeroStatCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors = [AppColors.sliderBlue, AppColors.sliderGreen];
  final Color color = Colors.white.withOpacity(0.12);
  final FontWeight fontWeight = FontWeight.w700;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.heroStatCardPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizesRadius.heroStatCard.value),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: Padding(
        padding: AppPaddings.orDividerPadding,
        child: Row(
          children: <Widget>[
            Padding(
              padding: AppPaddings.heroStatCardIconPadding,
              child: Container(
                padding: AppPaddings.inputTextFormPrefixIconPadding,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: IconWidget(
                  icon: icon,
                  color: AppColors.white,
                  size: AppSizesIcon.inputTextFormIconSize.value,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: <Widget>[
                  NormalText(label: title, fontWeight: fontWeight),

                  Padding(
                    padding: AppPaddings.heroStatCardSubtitlePadding,
                    child: BodyMediumText(text: subtitle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxShadow _boxShadowMethod() {
    final Color color = colors.last.withOpacity(0.35);
    final Offset offset = const Offset(0, 12);

    return BoxShadow(
      color: color,
      blurRadius: AppSizesRadius.card.value,
      offset: offset,
    );
  }
}
