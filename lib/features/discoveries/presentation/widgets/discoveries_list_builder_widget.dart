import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/category_group.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';

class DiscoveriesListBuilderWidget extends StatelessWidget {
  const DiscoveriesListBuilderWidget({
    required this.groups, super.key,
  });

  final List<CategoryGroup> groups;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: AppPaddings.discoveriesListViewBuilderPadding,
      itemCount: groups.length,
      itemBuilder: (BuildContext context, int index) {
        final CategoryGroup group = groups[index];
        return CategoryCard(group: group);
      },
    );
  }
}