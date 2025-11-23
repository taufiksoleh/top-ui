import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';

/// Bottom navigation item data
class BottomNavItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;

  const BottomNavItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}

/// BottomNavMV - Molecule bottom navigation component
///
/// Bottom navigation bar with multiple items.
/// Follows atomic design principles as a molecule combining multiple atoms.
class BottomNavMV extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;

  const BottomNavMV({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          activeIcon: Icon(item.activeIcon ?? item.icon),
          label: item.label,
        );
      }).toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor ?? TopColor.brand600,
      unselectedItemColor: unselectedItemColor ?? TopColor.gray500,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TopTypography.labelSmall,
      unselectedLabelStyle: TopTypography.labelSmall,
      elevation: 8,
    );
  }
}
