import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Alert variant types
enum AlertVariant { info, success, warning, error }

/// AlertMV - Molecule alert component
///
/// Displays important messages with different severity levels.
/// Follows atomic design principles as a molecule combining multiple atoms.
class AlertMV extends StatelessWidget {
  final String title;
  final String? description;
  final AlertVariant variant;
  final VoidCallback? onClose;
  final Widget? icon;
  final List<Widget>? actions;

  const AlertMV({
    super.key,
    required this.title,
    this.description,
    this.variant = AlertVariant.info,
    this.onClose,
    this.icon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TopSpacing.md),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon ?? _getDefaultIcon(),
          const SizedBox(width: TopSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TopTypography.titleSmall.copyWith(
                    color: _getTextColor(),
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: TopSpacing.xs),
                  Text(
                    description!,
                    style: TopTypography.bodySmall.copyWith(
                      color: _getTextColor(),
                    ),
                  ),
                ],
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: TopSpacing.md),
                  Wrap(
                    spacing: TopSpacing.sm,
                    children: actions!,
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: TopSpacing.md),
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(TopSpacing.radiusFull),
              child: Icon(
                Icons.close,
                size: 20,
                color: _getIconColor(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _getDefaultIcon() {
    IconData iconData;
    switch (variant) {
      case AlertVariant.info:
        iconData = Icons.info_outline;
        break;
      case AlertVariant.success:
        iconData = Icons.check_circle_outline;
        break;
      case AlertVariant.warning:
        iconData = Icons.warning_amber_outlined;
        break;
      case AlertVariant.error:
        iconData = Icons.error_outline;
        break;
    }

    return Icon(
      iconData,
      size: 24,
      color: _getIconColor(),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case AlertVariant.info:
        return TopColor.blue50;
      case AlertVariant.success:
        return TopColor.success50;
      case AlertVariant.warning:
        return TopColor.warning50;
      case AlertVariant.error:
        return TopColor.error50;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case AlertVariant.info:
        return TopColor.blue200;
      case AlertVariant.success:
        return TopColor.success200;
      case AlertVariant.warning:
        return TopColor.warning200;
      case AlertVariant.error:
        return TopColor.error200;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case AlertVariant.info:
        return TopColor.blue600;
      case AlertVariant.success:
        return TopColor.success600;
      case AlertVariant.warning:
        return TopColor.warning600;
      case AlertVariant.error:
        return TopColor.error600;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case AlertVariant.info:
        return TopColor.blue900;
      case AlertVariant.success:
        return TopColor.success900;
      case AlertVariant.warning:
        return TopColor.warning900;
      case AlertVariant.error:
        return TopColor.error900;
    }
  }
}
