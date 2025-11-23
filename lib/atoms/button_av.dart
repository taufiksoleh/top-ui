import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Button size variants
enum ButtonSize { small, medium, large }

/// Button style variants
enum ButtonVariant { primary, secondary, outline, ghost, danger }

/// ButtonAV - Atomic button component
///
/// A versatile button component with multiple variants and sizes.
/// Follows atomic design principles as a foundational UI element.
class ButtonAV extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool disabled;

  const ButtonAV({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.leadingIcon,
    this.trailingIcon,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || onPressed == null || isLoading;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: _getButtonStyle(isDisabled),
        child: Padding(
          padding: _getPadding(),
          child: isLoading
              ? _buildLoadingIndicator()
              : _buildButtonContent(),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          leadingIcon!,
          const SizedBox(width: TopSpacing.sm),
        ],
        Text(
          text,
          style: _getTextStyle(),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: TopSpacing.sm),
          trailingIcon!,
        ],
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: _getIconSize(),
      width: _getIconSize(),
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          _getLoadingIndicatorColor(),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(isDisabled),
      foregroundColor: _getForegroundColor(isDisabled),
      elevation: variant == ButtonVariant.primary ? 0 : 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
        side: _getBorderSide(isDisabled),
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        );
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: TopSpacing.buttonPaddingHorizontal,
          vertical: TopSpacing.buttonPaddingVertical,
        );
      case ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        );
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == ButtonSize.small
        ? TopTypography.labelMedium
        : size == ButtonSize.large
            ? TopTypography.labelLarge
            : TopTypography.labelLarge;

    return baseStyle.copyWith(color: _getForegroundColor(disabled));
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
    }
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (isDisabled) {
      return TopColor.gray100;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return TopColor.brand600;
      case ButtonVariant.secondary:
        return TopColor.gray100;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return Colors.transparent;
      case ButtonVariant.danger:
        return TopColor.error600;
    }
  }

  Color _getForegroundColor(bool isDisabled) {
    if (isDisabled) {
      return TopColor.gray400;
    }

    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.danger:
        return Colors.white;
      case ButtonVariant.secondary:
        return TopColor.gray700;
      case ButtonVariant.outline:
        return TopColor.brand600;
      case ButtonVariant.ghost:
        return TopColor.gray700;
    }
  }

  Color _getLoadingIndicatorColor() {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.danger:
        return Colors.white;
      case ButtonVariant.secondary:
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return TopColor.brand600;
    }
  }

  BorderSide _getBorderSide(bool isDisabled) {
    if (variant == ButtonVariant.outline) {
      return BorderSide(
        color: isDisabled ? TopColor.gray200 : TopColor.brand600,
        width: 1.5,
      );
    }
    return BorderSide.none;
  }
}
