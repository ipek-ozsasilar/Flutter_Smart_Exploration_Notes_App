import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
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
  const CategoryCard({required this.group});

  final CategoryGroup group;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding:  AppPaddings.loginViewGeneralPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            group.color.withOpacity(0.22),
            AppColors.black.withOpacity(0.5),
          ],
        ),
        border: Border.all(color: group.color.withOpacity(0.6), width: 1.2),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: group.color.withOpacity(0.45),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[group.color, group.color.withOpacity(0.7)],
              ),
            ),
            child: const IconWidget(
              icon: AppIcons.instance.label,
              color: AppColors.white,
              size: AppSizesIcon.label.value,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  group.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  group.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${group.count} keşif',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
