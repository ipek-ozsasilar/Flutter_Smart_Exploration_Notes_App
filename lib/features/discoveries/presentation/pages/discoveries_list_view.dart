import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/category_group.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/discoveries_list_appbar.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/discoveries_list_builder_widget.dart';

/// Keşiflerin etiket/kategori bazlı listelendiği ekran.
///
/// Şimdilik dummy veri ile sadece UI gösterimi yapar. İleride
/// gerçek keşif datası ile doldurulacaktır.
class DiscoveriesListView extends StatelessWidget {
  const DiscoveriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final int historicalBuildingsCount = 5;
    final int natureAndLandscapeCount = 8;
    final int streetArtCount = 3;
    final int coffeeAndPlacesCount = 4;
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    // Dummy kategori verisi
    final List<CategoryGroup> groups = <CategoryGroup>[
      CategoryGroup(
        title: AppStringsEnum.historicalBuildings.value,
        color: AppColors.sliderOrange,
        count: historicalBuildingsCount,
        description: AppStringsEnum.historicalBuildingsDescription.value,
      ),
      CategoryGroup(
        title: AppStringsEnum.natureAndLandscape.value,
        color: AppColors.sliderGreen,
        count: natureAndLandscapeCount,
        description: AppStringsEnum.natureAndLandscapeDescription.value,
      ),
      CategoryGroup(
        title: AppStringsEnum.streetArt.value,
        color: AppColors.cubixPurple,
        count: streetArtCount,
        description: AppStringsEnum.streetArtDescription.value,
      ),
      CategoryGroup(
        title: AppStringsEnum.coffeeAndPlaces.value,
        color: AppColors.sliderBlue,
        count: coffeeAndPlacesCount,
        description: AppStringsEnum.coffeeAndPlacesDescription.value,
      ),
    ];

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              /// Üst bar
              Padding(
                padding: AppPaddings.orDividerPadding,
                child: const DiscoveriesListAppBar(),
              ),
              /// Kategori kartlarının listelendiği yer
              Padding(
                padding: AppPaddings.discoveriesListViewDescriptionPadding,
                child: BodyMediumText(
                  text: AppStringsEnum.discoveriesListViewDescription.value,
                ),
              ),
              
              /// Kategori kartlarının listelendiği yer
              Expanded(child: DiscoveriesListBuilderWidget(groups: groups)),
            ],
          ),
        ),
      ),
    );
  }
}
