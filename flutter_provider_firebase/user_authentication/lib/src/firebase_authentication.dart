import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_authentication/src/authentication_repository.dart';

class FirebaseAuthenticationRepository with ChangeNotifier implements AuthenticationRepository{
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthenticationRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<bool> currentUser;

  @override
  Future<void> authenticate(){
    return _firebaseAuth.signInAnonymously();
  }

  @override
  Future<String> getUserId() async{
    log("@!!currentUser: ${_firebaseAuth.currentUser.uid}}");
    return (_firebaseAuth.currentUser).uid;
  }

  @override
  Future<bool> _isAuthenticated() async{
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  void isAuthenticated() {
    currentUser = _isAuthenticated();

  }
}