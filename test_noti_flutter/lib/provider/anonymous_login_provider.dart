import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AnonymousLoginProvider {
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;
  var _isAuth = false;

  FirebaseAuthModel() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  Future<void> authenticate() async {
    _firebaseAuth = FirebaseAuth.instance;
    var result = await _firebaseAuth.signInAnonymously();
    _isAuth = result != null;
    // notifyListeners();
  }

  bool checkAuthenticated() {
    _isAuth = _firebaseAuth.currentUser != null;
    return _isAuth;
  }

  bool isAuth() {
    return _isAuth;
  }

  Future<bool> mustReturntrue() async {
    return true;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    log("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    var user = await _firebaseAuth.signInWithCredential(credential);
    log("@!!User: ${user.credential}");
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}