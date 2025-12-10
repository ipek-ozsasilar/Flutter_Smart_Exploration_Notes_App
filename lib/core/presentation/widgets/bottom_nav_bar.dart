import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/notifications_view.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/map_view.dart';

/// Bottom navigation bar widget'Ä±
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.selectedIndex});
  final int? selectedIndex;
  final double elevation = 0;
  final double notchMargin = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.instance.homeAnimationInnerDotGradient,
        boxShadow: <BoxShadow>[_bottomNavBoxDecorationMethod()],
      ),
      child: BottomAppBar(
        notchMargin: notchMargin,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        color: Colors.transparent,
        elevation: elevation,
        child: SafeArea(
          child: Container(
            padding: AppPaddings.bottomNavBarPadding,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildNavItem(
                    context: context,
                    icon: AppIcons.instance.notifications,
                    activeIcon: AppIcons.instance.notificationsRounded,
                    label: AppStringsEnum.notify.value,
                    index: 0,
                    isActive: selectedIndex == 0,
                    onTap: () {
                      if (selectedIndex != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const NotificationsView(),
                          ),
                        );
                      }
                    },
                  ),
                ),

                // Ortadaki + butonu iÃ§in boÅŸluk
                const SizedBox(width: 80),

                Expanded(
                  flex: 1,
                  child: _buildNavItem(
                    context: context,
                    icon: AppIcons.instance.mapOutlined,
                    activeIcon: AppIcons.instance.mapRounded,
                    label: AppStringsEnum.map.value,
                    index: 2,
                    isActive: selectedIndex == 2,
                    onTap: () {
                      if (selectedIndex != 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const MapView(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxShadow _bottomNavBoxDecorationMethod() {
    final Color color = AppColors.black.withValues(alpha: 0.4);
    final Offset offset = const Offset(0, -8);
    final double blurRadius = 25;
    return BoxShadow(color: color, blurRadius: blurRadius, offset: offset);
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
          color: isActive
              ? AppColors.sliderBlue.withValues(alpha: 0.25)
              : Colors.transparent,
        ),
        child: IconWidget(
          icon: isActive ? activeIcon : icon,
          color: isActive
              ? AppColors.sliderBlue
              : AppColors.white.withValues(alpha: 0.7),
          size: AppSizesIcon.inputTextFormIconSize.value,
        ),
      ),
    );
  }
}

