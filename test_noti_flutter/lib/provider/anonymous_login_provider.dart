import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AnonymousLoginProvider with ChangeNotifier{
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;

  var userCredential;

  var _isAuth = LoginState.init;
  LoginState get loginState => _isAuth;

  AnonymousLoginProvider() {
    _firebaseAuth = FirebaseAuth.instance;
    // _googleSignIn = GoogleSignIn();
  }

  Future<UserCredential> authenticate() async {
    userCredential = _firebaseAuth.signInAnonymously();
    return userCredential;
  }

  String get uid => _firebaseAuth.currentUser.uid;

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
  init,
  error,
  waiting,
  done,
}