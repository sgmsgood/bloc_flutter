import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class CheckIsLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(color: Colors.amberAccent,),
        ),
      ),
    );
  }

  void _authAnonymously(BuildContext context) async {
    // var authModel = context.read<FirebaseAuthenticationRepository>();

    // if(authModel.checkAuthenticated()) {
    //   _moveToListPage(context);
    //   return;
    // }
    //
    // var credential = await authModel.authenticate();
    // if(credential != null) {
    //   _moveToListPage(context);
    //   return;
    // }
  }

  void _showMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _moveToListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TodoListPage(),
      ),
    );
  }
}
