import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Chip variant types
enum ChipVariant { filled, outlined }

/// ChipMV - Molecule chip component
///
/// Interactive chips for selections, filters, or tags.
/// Follows atomic design principles as a molecule combining multiple atoms.
class ChipMV extends StatelessWidget {
  final String label;
  final ChipVariant variant;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool selected;
  final Color? backgroundColor;
  final Color? selectedColor;

  const ChipMV({
    super.key,
    required this.label,
    this.variant = ChipVariant.filled,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.onDelete,
    this.selected = false,
    this.backgroundColor,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(TopSpacing.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TopSpacing.md,
          vertical: TopSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(TopSpacing.radiusFull),
          border: variant == ChipVariant.outlined
              ? Border.all(
                  color: selected ? TopColor.brand600 : TopColor.gray300,
                  width: 1,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: TopSpacing.xs),
            ],
            Text(
              label,
              style: TopTypography.labelMedium.copyWith(
                color: _getTextColor(),
              ),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: TopSpacing.xs),
              trailingIcon!,
            ],
            if (onDelete != null) ...[
              const SizedBox(width: TopSpacing.xs),
              InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(TopSpacing.radiusFull),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: TopColor.gray600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    if (variant == ChipVariant.outlined) {
      return selected ? TopColor.brand50 : Colors.transparent;
    }

    if (selected) {
      return selectedColor ?? TopColor.brand100;
    }

    return TopColor.gray100;
  }

  Color _getTextColor() {
    if (variant == ChipVariant.outlined && selected) {
      return TopColor.brand700;
    }

    if (selected) {
      return TopColor.brand700;
    }

    return TopColor.gray700;
  }
}
