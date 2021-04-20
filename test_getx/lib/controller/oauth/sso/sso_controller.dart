import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'google_oauth.dart';

class SSOController extends GetxController{
  GoogleAuth _googleAuth = GoogleAuth();
  // AppleAuth _appleAuth = AppleAuth();

  Future<User> googleSignIn() async => await _googleAuth.signInWithGoogle();

  Future<void> googleSignOut() async => await _googleAuth.signOutGoogle();

  // Future<User> appleSignIn() async => await _appleAuth.signInWithApple();
  //
  // Future<void> appleSignOut() async => await _appleAuth.signOutApple();
}