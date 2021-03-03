import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthModel {
  bool checkAuthenticated();

  Future<void> authenticate();

  Future<User> signInWithGoogle();
}