import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// ListItemMV - Molecule list item component
///
/// A versatile list item with leading, title, subtitle, and trailing elements.
/// Follows atomic design principles as a molecule combining multiple atoms.
class ListItemMV extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ListItemMV({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: TopSpacing.listItemPadding,
              vertical: TopSpacing.md,
            ),
        color: backgroundColor,
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: TopSpacing.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TopTypography.bodyMedium.copyWith(
                      color: TopColor.gray900,
                      fontWeight: TopTypography.medium,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: TopSpacing.xs),
                    Text(
                      subtitle!,
                      style: TopTypography.bodySmall.copyWith(
                        color: TopColor.gray600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: TopSpacing.md),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
