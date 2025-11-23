import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Input size variants
enum InputSize { small, medium, large }

/// InputAV - Atomic input/text field component
///
/// A versatile input component with validation and different states.
/// Follows atomic design principles as a foundational form element.
class InputAV extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  final InputSize size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  const InputAV({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.size = InputSize.medium,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.inputFormatters,
    this.initialValue,
  });

  @override
  State<InputAV> createState() => _InputAVState();
}

class _InputAVState extends State<InputAV> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TopTypography.labelMedium.copyWith(
              color: TopColor.gray700,
              fontWeight: TopTypography.medium,
            ),
          ),
          const SizedBox(height: TopSpacing.xs),
        ],
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.obscureText,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          inputFormatters: widget.inputFormatters,
          style: _getTextStyle(),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TopTypography.bodyMedium.copyWith(
              color: TopColor.gray400,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor: widget.enabled ? Colors.white : TopColor.gray50,
            contentPadding: _getPadding(),
            border: _getBorder(false, false),
            enabledBorder: _getBorder(false, false),
            focusedBorder: _getBorder(true, false),
            errorBorder: _getBorder(false, true),
            focusedErrorBorder: _getBorder(true, true),
            disabledBorder: _getBorder(false, false),
            counterText: '',
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: TopSpacing.xs),
          Text(
            widget.errorText!,
            style: TopTypography.bodySmall.copyWith(
              color: TopColor.error600,
            ),
          ),
        ] else if (widget.helperText != null) ...[
          const SizedBox(height: TopSpacing.xs),
          Text(
            widget.helperText!,
            style: TopTypography.bodySmall.copyWith(
              color: TopColor.gray600,
            ),
          ),
        ],
      ],
    );
  }

  TextStyle _getTextStyle() {
    switch (widget.size) {
      case InputSize.small:
        return TopTypography.bodySmall;
      case InputSize.medium:
        return TopTypography.bodyMedium;
      case InputSize.large:
        return TopTypography.bodyLarge;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case InputSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case InputSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: TopSpacing.inputPaddingHorizontal,
          vertical: TopSpacing.inputPaddingVertical,
        );
      case InputSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }

  OutlineInputBorder _getBorder(bool isFocused, bool hasError) {
    Color borderColor;

    if (!widget.enabled) {
      borderColor = TopColor.gray200;
    } else if (hasError) {
      borderColor = TopColor.error600;
    } else if (isFocused) {
      borderColor = TopColor.brand600;
    } else {
      borderColor = TopColor.gray300;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
      borderSide: BorderSide(
        color: borderColor,
        width: isFocused ? 2 : 1,
      ),
    );
  }
}
