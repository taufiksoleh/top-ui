import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';

/// Avatar size variants
enum AvatarSize { small, medium, large, extraLarge }

/// AvatarAV - Atomic avatar component
///
/// Displays user avatars with images or initials.
/// Follows atomic design principles as a foundational UI element.
class AvatarAV extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final AvatarSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const AvatarAV({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = AvatarSize.medium,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final diameter = _getSize();

    Widget avatar = Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: backgroundColor ?? TopColor.brand100,
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials!,
                style: _getTextStyle().copyWith(
                  color: textColor ?? TopColor.brand600,
                ),
              ),
            )
          : null,
    );

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(diameter / 2),
        child: avatar,
      );
    }

    return avatar;
  }

  double _getSize() {
    switch (size) {
      case AvatarSize.small:
        return 32;
      case AvatarSize.medium:
        return 40;
      case AvatarSize.large:
        return 56;
      case AvatarSize.extraLarge:
        return 80;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case AvatarSize.small:
        return TopTypography.labelSmall;
      case AvatarSize.medium:
        return TopTypography.labelMedium;
      case AvatarSize.large:
        return TopTypography.labelLarge;
      case AvatarSize.extraLarge:
        return TopTypography.titleLarge;
    }
  }
}
