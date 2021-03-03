import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: RaisedButton(
              onPressed: () => _authAnonymously(context),
              child: Text('login'),
            ),
          ),
        ),
      ),
    );
  }

  void _authAnonymously(BuildContext context) async {
    var authModel = context.read<FirebaseAuthModel>();

    await authModel.authenticate();
    if(!authModel.checkAuthenticated()) {
      return;
    }

    _moveToListPage(context);
  }

  void _moveToListPage(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/listPage');
  }
}
