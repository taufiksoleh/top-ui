import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/spacing.dart';

/// Card elevation variants
enum CardElevation { none, low, medium, high }

/// CardMV - Molecule card component
///
/// A versatile card component for displaying grouped content.
/// Follows atomic design principles as a molecule combining multiple atoms.
class CardMV extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final CardElevation elevation;
  final double? borderRadius;
  final VoidCallback? onTap;
  final Border? border;

  const CardMV({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.elevation = CardElevation.low,
    this.borderRadius,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius:
            BorderRadius.circular(borderRadius ?? TopSpacing.radiusMd),
        border: border ??
            Border.all(
              color: TopColor.gray200,
              width: 1,
            ),
        boxShadow: _getBoxShadow(),
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.all(TopSpacing.cardPadding),
        child: child,
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(borderRadius ?? TopSpacing.radiusMd),
        child: card,
      );
    }

    return card;
  }

  List<BoxShadow> _getBoxShadow() {
    switch (elevation) {
      case CardElevation.none:
        return [];
      case CardElevation.low:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
      case CardElevation.medium:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ];
      case CardElevation.high:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ];
    }
  }
}
