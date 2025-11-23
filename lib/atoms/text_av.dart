import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';

/// Text variant types
enum TextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// TextAV - Atomic text component
///
/// A text component that provides consistent typography across the app.
/// Follows atomic design principles as a foundational text element.
class TextAV extends StatelessWidget {
  final String text;
  final TextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const TextAV(
    this.text, {
    super.key,
    this.variant = TextVariant.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle().copyWith(
        color: color ?? TopColor.gray900,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle() {
    switch (variant) {
      case TextVariant.displayLarge:
        return TopTypography.displayLarge;
      case TextVariant.displayMedium:
        return TopTypography.displayMedium;
      case TextVariant.displaySmall:
        return TopTypography.displaySmall;
      case TextVariant.headlineLarge:
        return TopTypography.headlineLarge;
      case TextVariant.headlineMedium:
        return TopTypography.headlineMedium;
      case TextVariant.headlineSmall:
        return TopTypography.headlineSmall;
      case TextVariant.titleLarge:
        return TopTypography.titleLarge;
      case TextVariant.titleMedium:
        return TopTypography.titleMedium;
      case TextVariant.titleSmall:
        return TopTypography.titleSmall;
      case TextVariant.bodyLarge:
        return TopTypography.bodyLarge;
      case TextVariant.bodyMedium:
        return TopTypography.bodyMedium;
      case TextVariant.bodySmall:
        return TopTypography.bodySmall;
      case TextVariant.labelLarge:
        return TopTypography.labelLarge;
      case TextVariant.labelMedium:
        return TopTypography.labelMedium;
      case TextVariant.labelSmall:
        return TopTypography.labelSmall;
    }
  }
}
