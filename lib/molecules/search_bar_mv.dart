import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';
import '../atoms/icon_av.dart';

/// SearchBarMV - Molecule search bar component
///
/// A search input with icon and clear functionality.
/// Follows atomic design principles as a molecule combining multiple atoms.
class SearchBarMV extends StatefulWidget {
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final Widget? leadingIcon;
  final bool showClearButton;

  const SearchBarMV({
    super.key,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.autofocus = false,
    this.leadingIcon,
    this.showClearButton = true,
  });

  @override
  State<SearchBarMV> createState() => _SearchBarMVState();
}

class _SearchBarMVState extends State<SearchBarMV> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
    widget.onChanged?.call(_controller.text);
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TopColor.gray50,
        borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
        border: Border.all(
          color: TopColor.gray200,
          width: 1,
        ),
      ),
      child: TextField(
        controller: _controller,
        autofocus: widget.autofocus,
        onSubmitted: widget.onSubmitted,
        style: TopTypography.bodyMedium,
        decoration: InputDecoration(
          hintText: widget.placeholder ?? 'Search...',
          hintStyle: TopTypography.bodyMedium.copyWith(
            color: TopColor.gray400,
          ),
          prefixIcon: widget.leadingIcon ??
              const IconAV(
                Icons.search,
                size: IconSize.medium,
              ),
          suffixIcon: widget.showClearButton && _hasText
              ? IconButton(
                  icon: const IconAV(
                    Icons.clear,
                    size: IconSize.small,
                  ),
                  onPressed: _clearText,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: TopSpacing.md,
            vertical: TopSpacing.inputPaddingVertical,
          ),
        ),
      ),
    );
  }
}
