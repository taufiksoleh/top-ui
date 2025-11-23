import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// RadioAV - Atomic radio button component
///
/// Radio input with optional label.
/// Follows atomic design principles as a foundational form element.
class RadioAV<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool disabled;
  final Color? activeColor;

  const RadioAV({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.disabled = false,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: disabled ? null : onChanged,
        activeColor: activeColor ?? TopColor.brand600,
      );
    }

    return InkWell(
      onTap: disabled ? null : () => onChanged?.call(value),
      borderRadius: BorderRadius.circular(TopSpacing.radiusSm),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TopSpacing.xs),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: disabled ? null : onChanged,
              activeColor: activeColor ?? TopColor.brand600,
            ),
            const SizedBox(width: TopSpacing.sm),
            Flexible(
              child: Text(
                label!,
                style: TopTypography.bodyMedium.copyWith(
                  color: disabled ? TopColor.gray400 : TopColor.gray700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
