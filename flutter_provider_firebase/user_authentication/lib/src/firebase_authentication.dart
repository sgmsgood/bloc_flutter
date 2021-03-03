import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_authentication/src/authentication_repository.dart';

class FirebaseAuthModel extends ChangeNotifier implements AuthModel{
  final FirebaseAuth _firebaseAuth;
  var _isAuth = false;

  FirebaseAuthModel({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

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
}