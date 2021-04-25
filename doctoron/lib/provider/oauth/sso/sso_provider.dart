
import 'package:doctoron/provider/oauth/sso/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SSOProvider {
  GoogleAuth _googleAuth = GoogleAuth();
  // AppleAuth _appleAuth = AppleAuth();

  Future<User> googleSignIn() async => await _googleAuth.signInWithGoogle();

  Future<void> googleSignOut() async => await _googleAuth.signOutGoogle();

  // Future<User> appleSignIn() async => await _appleAuth.signInWithApple();

  // Future<void> appleSignOut() async => await _appleAuth.signOutApple();
}