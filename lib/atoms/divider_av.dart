import 'package:flutter/material.dart';
import '../foundation/color.dart';

/// Divider orientation
enum DividerOrientation { horizontal, vertical }

/// DividerAV - Atomic divider component
///
/// Creates visual separation between content.
/// Follows atomic design principles as a foundational UI element.
class DividerAV extends StatelessWidget {
  final DividerOrientation orientation;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;
  final double? height;
  final double? width;

  const DividerAV({
    super.key,
    this.orientation = DividerOrientation.horizontal,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (orientation == DividerOrientation.vertical) {
      return VerticalDivider(
        thickness: thickness ?? 1,
        color: color ?? TopColor.gray200,
        indent: indent,
        endIndent: endIndent,
        width: width ?? 1,
      );
    }

    return Divider(
      thickness: thickness ?? 1,
      color: color ?? TopColor.gray200,
      indent: indent,
      endIndent: endIndent,
      height: height ?? 1,
    );
  }
}
