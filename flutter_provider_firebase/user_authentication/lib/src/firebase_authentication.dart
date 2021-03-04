import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_authentication/src/authentication_repository.dart';

class FirebaseAuthModel extends ChangeNotifier implements AuthModel {
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;
  var _isAuth = false;

  FirebaseAuthModel() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  @override
  Future<void> authenticate() async {
    var result = await _firebaseAuth.signInAnonymously();
    _isAuth = result != null;
    notifyListeners();
  }

  @override
  bool checkAuthenticated() {
    _isAuth = _firebaseAuth.currentUser != null;
    return _isAuth;
  }

  bool isAuth() {
    return _isAuth;
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      log("@!!GoogleSignInAuthentication: $GoogleSignInAuthentication");

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      log("@!!AuthCredential: $AuthCredential");

      final UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);
      log("@!!authResult: $authResult");
      final User user = authResult.user;

      log("@!!user: ${user.getIdToken(false)}");

      if (user != null) {
        return user;
      } else {
        print("@!!!!!!!!!!!!!!! nullllll -------------------!!!!!!!");
      }
    } catch (e) {
      print("@!!e: $e");
      return null;
    }
    notifyListeners();
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
