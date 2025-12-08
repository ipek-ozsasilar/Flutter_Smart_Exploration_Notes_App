import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/maps_notifications_top_bar_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/notification_card.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/capture_view.dart';

/// Bildirim modeli (dummy data için)
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
  });
}

/// Bildirimler ekranı
class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  /// Dummy bildirim listesi (Firebase'den gelecek)
  final List<NotificationItem> _notifications = <NotificationItem>[
    NotificationItem(
      id: '1',
      title: 'Yeni Keşif Hatırlatması',
      message: 'İstanbul\'daki keşif noktanıza yaklaşıyorsunuz',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'Keşif Tamamlandı',
      message: 'Galata Kulesi keşfiniz başarıyla kaydedildi',
      date: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    NotificationItem(
      id: '3',
      title: 'Yeni Keşif Hatırlatması',
      message: 'Topkapı Sarayı Müzesi\'ne yaklaşıyorsunuz',
      date: DateTime.now().subtract(const Duration(days: 2)),
      isRead: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              /// Üst bar
              MapsNotificationsTopBarWidget(
                title: AppStringsEnum.notifications.value,
              ),

              /// İçerik - Bildirim Listesi
              Expanded(
                child: Padding(
                  padding: AppPaddings.notificationsViewPadding,
                  child: _notifications.isEmpty
                      ? _buildEmptyState()
                      : _buildNotificationsList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
      extendBody: true,
    );
  }

  /// Bildirim yoksa gösterilecek boş durum widget'ı
  Widget _buildEmptyState() {
    final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
    final Color color = AppColors.white.withOpacity(0.5);
    return Center(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          IconWidget(
            icon: AppIcons.instance.notifications,
            color: color,
            size: AppSizesIcon.homeBottomCardFlagIconSize.value,
          ),

          Padding(
            padding: AppPaddings.notificationsViewPadding,
            child: BodyMediumText(
              text: AppStringsEnum.noNotifications.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Bildirim listesi widget'ı
  Widget _buildNotificationsList() {
    return ListView.builder(
      padding: AppPaddings.orDividerPadding,
      itemCount: _notifications.length,
      itemBuilder: (BuildContext context, int index) {
        final NotificationItem notification = _notifications[index];
        return NotificationCard(notification: notification);
      },
    );
  }
}
