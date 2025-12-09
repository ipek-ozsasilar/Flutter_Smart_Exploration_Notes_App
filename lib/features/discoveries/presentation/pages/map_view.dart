import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/google_maps_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/icon_and_title_top_bar.dart.dart';

/// Harita ekranı
class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    final bool extendBody = true;
    final FloatingActionButtonLocation floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked;
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              /// Üst bar
              Padding(
                padding: AppPaddings.orDividerPadding,
                child: IconAndTitleTopBarWidget(
                  title: AppStringsEnum.map.value,
                ),
              ),

              /// İçerik - Google Maps
              Expanded(child: GoogleMapsWidget()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(),
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      extendBody: extendBody,
    );
  }
}
