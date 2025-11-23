import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';

/// Tab item data
class TabItem {
  final String label;
  final IconData? icon;

  const TabItem({
    required this.label,
    this.icon,
  });
}

/// TabBarMV - Molecule tab bar component
///
/// Tab bar with multiple tabs for navigation.
/// Follows atomic design principles as a molecule combining multiple atoms.
class TabBarMV extends StatelessWidget implements PreferredSizeWidget {
  final List<TabItem> items;
  final TabController? controller;
  final ValueChanged<int>? onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final bool isScrollable;

  const TabBarMV({
    super.key,
    required this.items,
    this.controller,
    this.onTap,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      onTap: onTap,
      isScrollable: isScrollable,
      indicatorColor: indicatorColor ?? TopColor.brand600,
      labelColor: labelColor ?? TopColor.brand600,
      unselectedLabelColor: unselectedLabelColor ?? TopColor.gray500,
      labelStyle: TopTypography.labelLarge,
      unselectedLabelStyle: TopTypography.labelLarge,
      tabs: items.map((item) {
        if (item.icon != null) {
          return Tab(
            icon: Icon(item.icon),
            text: item.label,
          );
        }
        return Tab(text: item.label);
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
