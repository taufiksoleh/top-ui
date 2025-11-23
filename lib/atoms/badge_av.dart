import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Badge variant types
enum BadgeVariant { primary, success, warning, error, neutral }

/// Badge size variants
enum BadgeSize { small, medium }

/// BadgeAV - Atomic badge component
///
/// Displays status, labels, or notifications.
/// Follows atomic design principles as a foundational UI element.
class BadgeAV extends StatelessWidget {
  final String text;
  final BadgeVariant variant;
  final BadgeSize size;
  final Widget? icon;

  const BadgeAV({
    super.key,
    required this.text,
    this.variant = BadgeVariant.neutral,
    this.size = BadgeSize.medium,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(TopSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: _getTextStyle().copyWith(
              color: _getTextColor(),
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 2);
      case BadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 4);
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case BadgeSize.small:
        return TopTypography.labelSmall;
      case BadgeSize.medium:
        return TopTypography.labelMedium;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case BadgeVariant.primary:
        return TopColor.brand100;
      case BadgeVariant.success:
        return TopColor.success100;
      case BadgeVariant.warning:
        return TopColor.warning100;
      case BadgeVariant.error:
        return TopColor.error100;
      case BadgeVariant.neutral:
        return TopColor.gray100;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case BadgeVariant.primary:
        return TopColor.brand700;
      case BadgeVariant.success:
        return TopColor.success700;
      case BadgeVariant.warning:
        return TopColor.warning700;
      case BadgeVariant.error:
        return TopColor.error700;
      case BadgeVariant.neutral:
        return TopColor.gray700;
    }
  }
}
