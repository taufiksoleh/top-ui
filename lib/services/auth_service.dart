import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

/// Authentication result model
class AuthResult {
  final bool success;
  final String? userId;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? error;
  final AuthProvider provider;

  AuthResult({
    required this.success,
    this.userId,
    this.email,
    this.displayName,
    this.photoUrl,
    this.error,
    required this.provider,
  });
}

/// Authentication provider types
enum AuthProvider { google, apple, facebook, email }

/// AuthService - Handles social authentication
///
/// Provides methods to authenticate users via Google, Apple, and Facebook.
/// This is a service layer component that handles authentication logic.
class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  /// Sign in with Google
  Future<AuthResult> signInWithGoogle() async {
    try {
      // Attempt to sign in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in
        return AuthResult(
          success: false,
          error: 'Sign in cancelled',
          provider: AuthProvider.google,
        );
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Return successful result with user data
      return AuthResult(
        success: true,
        userId: googleUser.id,
        email: googleUser.email,
        displayName: googleUser.displayName,
        photoUrl: googleUser.photoUrl,
        provider: AuthProvider.google,
      );
    } catch (e) {
      return AuthResult(
        success: false,
        error: e.toString(),
        provider: AuthProvider.google,
      );
    }
  }

  /// Sign in with Apple
  Future<AuthResult> signInWithApple() async {
    try {
      // Request credential
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Build display name from name components
      String? displayName;
      if (credential.givenName != null || credential.familyName != null) {
        displayName =
            '${credential.givenName ?? ''} ${credential.familyName ?? ''}'
                .trim();
      }

      // Return successful result
      return AuthResult(
        success: true,
        userId: credential.userIdentifier,
        email: credential.email,
        displayName: displayName,
        provider: AuthProvider.apple,
      );
    } catch (e) {
      return AuthResult(
        success: false,
        error: e.toString(),
        provider: AuthProvider.apple,
      );
    }
  }

  /// Sign in with Facebook
  Future<AuthResult> signInWithFacebook() async {
    try {
      // Attempt to log in
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        // Get user data
        final userData = await FacebookAuth.instance.getUserData(
          fields: "email,name,picture.width(200)",
        );

        return AuthResult(
          success: true,
          userId: userData['id'],
          email: userData['email'],
          displayName: userData['name'],
          photoUrl: userData['picture']?['data']?['url'],
          provider: AuthProvider.facebook,
        );
      } else if (result.status == LoginStatus.cancelled) {
        return AuthResult(
          success: false,
          error: 'Sign in cancelled',
          provider: AuthProvider.facebook,
        );
      } else {
        return AuthResult(
          success: false,
          error: result.message ?? 'Unknown error',
          provider: AuthProvider.facebook,
        );
      }
    } catch (e) {
      return AuthResult(
        success: false,
        error: e.toString(),
        provider: AuthProvider.facebook,
      );
    }
  }

  /// Sign out from all providers
  Future<void> signOut() async {
    await Future.wait([
      _googleSignIn.signOut(),
      FacebookAuth.instance.logOut(),
    ]);
  }

  /// Check if user is currently signed in with Google
  Future<bool> isSignedInWithGoogle() async {
    return await _googleSignIn.isSignedIn();
  }

  /// Get current Google user
  GoogleSignInAccount? get currentGoogleUser => _googleSignIn.currentUser;
}
