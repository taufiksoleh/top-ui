import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/spacing.dart';

/// Image fit modes
enum ImageFitMode { cover, contain, fill, fitWidth, fitHeight }

/// ImageAV - Atomic image component
///
/// Displays images with consistent styling and loading states.
/// Follows atomic design principles as a foundational UI element.
class ImageAV extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double? width;
  final double? height;
  final ImageFitMode fit;
  final double? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ImageAV({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.width,
    this.height,
    this.fit = ImageFitMode.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  }) : assert(imageUrl != null || assetPath != null,
            'Either imageUrl or assetPath must be provided');

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (assetPath != null) {
      image = Image.asset(
        assetPath!,
        width: width,
        height: height,
        fit: _getBoxFit(),
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? _defaultErrorWidget(),
      );
    } else {
      image = Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: _getBoxFit(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ?? _defaultPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? _defaultErrorWidget(),
      );
    }

    if (borderRadius != null && borderRadius! > 0) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: image,
      );
    }

    return image;
  }

  BoxFit _getBoxFit() {
    switch (fit) {
      case ImageFitMode.cover:
        return BoxFit.cover;
      case ImageFitMode.contain:
        return BoxFit.contain;
      case ImageFitMode.fill:
        return BoxFit.fill;
      case ImageFitMode.fitWidth:
        return BoxFit.fitWidth;
      case ImageFitMode.fitHeight:
        return BoxFit.fitHeight;
    }
  }

  Widget _defaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: TopColor.gray100,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(TopColor.gray400),
        ),
      ),
    );
  }

  Widget _defaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: TopColor.gray100,
      child: Icon(
        Icons.broken_image_outlined,
        size: 32,
        color: TopColor.gray400,
      ),
    );
  }
}
