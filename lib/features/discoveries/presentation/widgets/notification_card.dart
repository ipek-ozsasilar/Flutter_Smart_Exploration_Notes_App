import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/notifications_view.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({super.key, required this.notification});
  final NotificationItem notification;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  final Color color = AppColors.white.withOpacity(0.2);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: AppPaddings.inputTextFormPrefixIconPadding,
      decoration: _boxDecoration(),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          /// Bildirim ikonu
          Padding(
            padding: AppPaddings.heroStatCardIconPadding,
            child: Container(
              width: AppSizesEnum.notificationCardIconSize.value,
              height: AppSizesEnum.notificationCardIconSize.value,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: IconWidget(
                icon: AppIcons.instance.notifications,
                color: AppColors.white,
                size: AppSizesEnum.notificationCardIconSize.value,
              ),
            ),
          ),

          /// Bildirim içeriği
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NormalText(
                  label: notification.title,
                  fontWeight: notification.isRead
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),

                Padding(
                  padding: AppPaddings.notificationCardPadding,
                  child: BodyMediumText(text: notification.message),
                ),

                LabelMediumOpacityText(text: _formatDate(notification.date)),
              ],
            ),
          ),

          /// Okunmamış bildirim göstergesi
          if (!notification.isRead)
            Container(
              width: AppSizesEnum.homeAnimationOrbitDotSize.value,
              height: AppSizesEnum.homeAnimationOrbitDotSize.value,
              decoration: const BoxDecoration(
                color: AppColors.sliderBlue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    final Color color = AppColors.white.withOpacity(0.1);
    final Color color2 = AppColors.white.withOpacity(0.2);
    final Color borderColor = AppColors.white.withOpacity(0.3);
    final double borderWidth = 1;
    return BoxDecoration(
      color: notification.isRead ? color : color2,
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      border: Border.all(
        color: notification.isRead ? Colors.transparent : borderColor,
        width: borderWidth,
      ),
    );
  }

  /// Tarih formatlama metodu
  String _formatDate(DateTime date) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} seconds ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
