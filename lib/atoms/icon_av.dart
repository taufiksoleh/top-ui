import 'package:flutter/material.dart';
import '../foundation/color.dart';

/// Icon size variants
enum IconSize { small, medium, large, extraLarge }

/// IconAV - Atomic icon component
///
/// A consistent icon component with predefined sizes.
/// Follows atomic design principles as a foundational UI element.
class IconAV extends StatelessWidget {
  final IconData icon;
  final IconSize size;
  final Color? color;

  const IconAV(
    this.icon, {
    super.key,
    this.size = IconSize.medium,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: _getIconSize(),
      color: color ?? TopColor.gray700,
    );
  }

  double _getIconSize() {
    switch (size) {
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 24;
      case IconSize.large:
        return 32;
      case IconSize.extraLarge:
        return 48;
    }
  }
}
