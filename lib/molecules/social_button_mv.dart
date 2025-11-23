import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// Social provider types
enum SocialProvider { google, apple, facebook }

/// SocialButtonMV - Molecule component for social sign-in buttons
///
/// A specialized button component for social authentication providers.
/// Includes provider-specific branding, colors, and icons.
class SocialButtonMV extends StatelessWidget {
  final SocialProvider provider;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;

  const SocialButtonMV({
    super.key,
    required this.provider,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getForegroundColor(),
          elevation: 0,
          side: BorderSide(
            color: _getBorderColor(),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: TopSpacing.buttonPaddingHorizontal,
            vertical: TopSpacing.buttonPaddingVertical,
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getForegroundColor(),
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getIcon(),
                  const SizedBox(width: TopSpacing.sm),
                  Text(
                    _getButtonText(),
                    style: TopTypography.labelLarge.copyWith(
                      color: _getForegroundColor(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _getIcon() {
    switch (provider) {
      case SocialProvider.google:
        return Image.asset(
          'assets/icons/google.png',
          width: 20,
          height: 20,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to a colored circle with 'G' if image not found
            return Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4285F4),
                  ),
                ),
              ),
            );
          },
        );
      case SocialProvider.apple:
        return const Icon(Icons.apple, size: 20);
      case SocialProvider.facebook:
        return const Icon(Icons.facebook, size: 20);
    }
  }

  String _getButtonText() {
    switch (provider) {
      case SocialProvider.google:
        return 'Continue with Google';
      case SocialProvider.apple:
        return 'Continue with Apple';
      case SocialProvider.facebook:
        return 'Continue with Facebook';
    }
  }

  Color _getBackgroundColor() {
    switch (provider) {
      case SocialProvider.google:
        return Colors.white;
      case SocialProvider.apple:
        return Colors.black;
      case SocialProvider.facebook:
        return const Color(0xFF1877F2);
    }
  }

  Color _getForegroundColor() {
    switch (provider) {
      case SocialProvider.google:
        return TopColor.gray700;
      case SocialProvider.apple:
        return Colors.white;
      case SocialProvider.facebook:
        return Colors.white;
    }
  }

  Color _getBorderColor() {
    switch (provider) {
      case SocialProvider.google:
        return TopColor.gray300;
      case SocialProvider.apple:
        return Colors.black;
      case SocialProvider.facebook:
        return const Color(0xFF1877F2);
    }
  }
}
