import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/home_bottom_card_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/bottom_nav_bar.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/home_top_bar_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/home_animation_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/home_discoveries_values_widget.dart';

/// Ana sayfa - Bottom navigation bar ile
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool extendBody = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: AppPaddings.loginViewGeneralPadding,
            child: Column(
              children: <Widget>[
                // Üst bar
                //_discovery countı alacak parametre olarak
                HomeTopBarWidget(discoveryCount: 0),

                // Orta kısım: animation + istatistikler
                Expanded(
                  child: Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: _HomeAnimationAndValuesWidget(),
                  ),
                ),

                // Alt kart
                HomeBottomCardWidget(),
              ],
            ),
          ),
        ),
      ),
      // Home ekranında yalnızca "İlk Keşfini Başlat" butonu kullanılacak,
      // bu yüzden ortadaki + FAB'i kaldırıyoruz.
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      extendBody: extendBody,
    );
  }
}

class _HomeAnimationAndValuesWidget extends StatelessWidget {
  const _HomeAnimationAndValuesWidget();

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
    final int flex = 5;
    final int flex2 = 4;
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Expanded(
          flex: flex,
          child: Padding(
            padding: AppPaddings.heroStatCardIconPadding,
            child: Center(child: HomeAnimationWidget()),
          ),
        ),
        Expanded(
          flex: flex2,
          // HomeDiscoveriesValuesWidget(progress: _progress, goalDiscovery: goalDiscovery, discoveryCount: _discoveryCount),
          child: HomeDiscoveriesValuesWidget(
            progress: 1.0,
            goalDiscovery: 0,
            discoveryCount: 0,
          ),
        ),
      ],
    );
  }
}
