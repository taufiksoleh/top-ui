import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// SwitchAV - Atomic switch/toggle component
///
/// Toggle switch input with optional label.
/// Follows atomic design principles as a foundational form element.
class SwitchAV extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool disabled;
  final Color? activeColor;

  const SwitchAV({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.disabled = false,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return Switch(
        value: value,
        onChanged: disabled ? null : onChanged,
        activeColor: activeColor ?? TopColor.brand600,
      );
    }

    return InkWell(
      onTap: disabled ? null : () => onChanged?.call(!value),
      borderRadius: BorderRadius.circular(TopSpacing.radiusSm),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TopSpacing.sm,
          horizontal: TopSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label!,
                style: TopTypography.bodyMedium.copyWith(
                  color: disabled ? TopColor.gray400 : TopColor.gray700,
                ),
              ),
            ),
            const SizedBox(width: TopSpacing.md),
            Switch(
              value: value,
              onChanged: disabled ? null : onChanged,
              activeColor: activeColor ?? TopColor.brand600,
            ),
          ],
        ),
      ),
    );
  }
}
