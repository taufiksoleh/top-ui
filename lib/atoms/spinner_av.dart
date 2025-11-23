import 'package:flutter/material.dart';
import '../foundation/color.dart';

/// Spinner size variants
enum SpinnerSize { small, medium, large }

/// SpinnerAV - Atomic loading spinner component
///
/// Displays loading state with circular progress indicator.
/// Follows atomic design principles as a foundational UI element.
class SpinnerAV extends StatelessWidget {
  final SpinnerSize size;
  final Color? color;
  final double? strokeWidth;

  const SpinnerAV({
    super.key,
    this.size = SpinnerSize.medium,
    this.color,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getSize(),
      height: _getSize(),
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? _getStrokeWidth(),
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? TopColor.brand600,
        ),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case SpinnerSize.small:
        return 16;
      case SpinnerSize.medium:
        return 24;
      case SpinnerSize.large:
        return 40;
    }
  }

  double _getStrokeWidth() {
    switch (size) {
      case SpinnerSize.small:
        return 2;
      case SpinnerSize.medium:
        return 3;
      case SpinnerSize.large:
        return 4;
    }
  }
}
