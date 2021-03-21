import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AnonymousLoginProvider with ChangeNotifier{
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;
  var _isAuth = LoginState.error;

  FirebaseAuthModel() {
    _firebaseAuth = FirebaseAuth.instance;
    // _googleSignIn = GoogleSignIn();
  }

  Future<void> authenticate() async {
    var result = await _firebaseAuth.signInAnonymously();
    log("@!!result: ${result.user}/  credential: ${result.credential.token}");
    // notif/yListeners();
  }

  // bool checkAuthenticated() {
  //   _isAuth = LoginState.done;
  //   return _isAuth;
  // }

  void isAuth() {

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

enum LoginState {
  error,
  waiting,
  done,
}