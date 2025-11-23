import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';
import '../atoms/button_av.dart';
import '../atoms/input_av.dart';
import '../atoms/text_av.dart';
import '../atoms/divider_av.dart';
import '../atoms/checkbox_av.dart';
import '../molecules/social_button_mv.dart';
import '../services/auth_service.dart';

/// RegisterPage - Template component for user registration
///
/// A complete registration page with email/password form and social sign-in options.
/// Includes Google, Apple, and Facebook authentication.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  bool _acceptTerms = false;
  bool _isLoading = false;
  bool _googleLoading = false;
  bool _appleLoading = false;
  bool _facebookLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _googleLoading = true;
      _errorMessage = null;
    });

    final result = await _authService.signInWithGoogle();

    setState(() {
      _googleLoading = false;
    });

    if (result.success) {
      _showSuccessDialog('Google', result);
    } else {
      setState(() {
        _errorMessage = result.error ?? 'Google sign-in failed';
      });
    }
  }

  Future<void> _handleAppleSignIn() async {
    setState(() {
      _appleLoading = true;
      _errorMessage = null;
    });

    final result = await _authService.signInWithApple();

    setState(() {
      _appleLoading = false;
    });

    if (result.success) {
      _showSuccessDialog('Apple', result);
    } else {
      setState(() {
        _errorMessage = result.error ?? 'Apple sign-in failed';
      });
    }
  }

  Future<void> _handleFacebookSignIn() async {
    setState(() {
      _facebookLoading = true;
      _errorMessage = null;
    });

    final result = await _authService.signInWithFacebook();

    setState(() {
      _facebookLoading = false;
    });

    if (result.success) {
      _showSuccessDialog('Facebook', result);
    } else {
      setState(() {
        _errorMessage = result.error ?? 'Facebook sign-in failed';
      });
    }
  }

  void _showSuccessDialog(String provider, AuthResult result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$provider Sign-In Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.displayName != null)
              Text('Name: ${result.displayName}'),
            if (result.email != null) Text('Email: ${result.email}'),
            if (result.userId != null) Text('ID: ${result.userId}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleEmailRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_acceptTerms) {
      setState(() {
        _errorMessage = 'Please accept the terms and conditions';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (!mounted) return;

    // Show success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registration Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${_nameController.text}'),
            Text('Email: ${_emailController.text}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(TopSpacing.screenPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: TopSpacing.xl),

                // Header
                const TextAV(
                  'Create Account',
                  variant: TextVariant.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TopSpacing.xs),
                const TextAV(
                  'Sign up to get started',
                  variant: TextVariant.bodyLarge,
                  color: TopColor.gray600,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: TopSpacing.xl),

                // Social sign-in buttons
                SocialButtonMV(
                  provider: SocialProvider.google,
                  onPressed: _handleGoogleSignIn,
                  isLoading: _googleLoading,
                ),
                const SizedBox(height: TopSpacing.md),

                SocialButtonMV(
                  provider: SocialProvider.apple,
                  onPressed: _handleAppleSignIn,
                  isLoading: _appleLoading,
                ),
                const SizedBox(height: TopSpacing.md),

                SocialButtonMV(
                  provider: SocialProvider.facebook,
                  onPressed: _handleFacebookSignIn,
                  isLoading: _facebookLoading,
                ),

                const SizedBox(height: TopSpacing.xl),

                // Divider with "OR"
                Row(
                  children: [
                    const Expanded(child: DividerAV()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TopSpacing.md,
                      ),
                      child: TextAV(
                        'OR',
                        variant: TextVariant.bodySmall,
                        color: TopColor.gray500,
                      ),
                    ),
                    const Expanded(child: DividerAV()),
                  ],
                ),

                const SizedBox(height: TopSpacing.xl),

                // Error message
                if (_errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(TopSpacing.md),
                    decoration: BoxDecoration(
                      color: TopColor.error50,
                      borderRadius: BorderRadius.circular(TopSpacing.radiusMd),
                      border: Border.all(color: TopColor.error200),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: TopColor.error600,
                          size: 20,
                        ),
                        const SizedBox(width: TopSpacing.sm),
                        Expanded(
                          child: TextAV(
                            _errorMessage!,
                            variant: TextVariant.bodySmall,
                            color: TopColor.error600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TopSpacing.md),
                ],

                // Name field
                InputAV(
                  label: 'Full Name',
                  placeholder: 'Enter your full name',
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                const SizedBox(height: TopSpacing.md),

                // Email field
                InputAV(
                  label: 'Email',
                  placeholder: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: TopSpacing.md),

                // Password field
                InputAV(
                  label: 'Password',
                  placeholder: 'Create a password',
                  controller: _passwordController,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  helperText: 'Must be at least 8 characters',
                ),

                const SizedBox(height: TopSpacing.lg),

                // Terms and conditions
                CheckboxAV(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                      if (_acceptTerms) {
                        _errorMessage = null;
                      }
                    });
                  },
                  label: 'I agree to the Terms and Conditions',
                ),

                const SizedBox(height: TopSpacing.xl),

                // Register button
                ButtonAV(
                  text: 'Create Account',
                  onPressed: _handleEmailRegister,
                  isLoading: _isLoading,
                  isFullWidth: true,
                  size: ButtonSize.large,
                ),

                const SizedBox(height: TopSpacing.lg),

                // Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextAV(
                      'Already have an account? ',
                      variant: TextVariant.bodyMedium,
                      color: TopColor.gray600,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login page
                      },
                      child: const TextAV(
                        'Sign In',
                        variant: TextVariant.bodyMedium,
                        color: TopColor.brand600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: TopSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
