import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_authentication/src/authentication_repository.dart';

class FirebaseAuthenticationRepository extends ChangeNotifier implements AuthenticationRepository{
  final FirebaseAuth _firebaseAuth;
  var _isAuth = false;

  FirebaseAuthenticationRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> authenticate() async {
    var result = await _firebaseAuth.signInAnonymously();
    _isAuth = result != null;
    notifyListeners();
  }

  @override
  Future<bool> checkAuthenticated() async {
    _isAuth = _firebaseAuth.currentUser != null;
    return Future.value(_isAuth);
  }
  
  bool isAuth() {
    return _isAuth;
  }
}