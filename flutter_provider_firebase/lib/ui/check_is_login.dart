import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class CheckIsLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<FirebaseAuthenticationRepository>();
    var userId;

    _authGoogle(context);

    authProvider.getUserId().then((value) {
      if(value.isEmpty || value == null) {
        userId = "";
      } else {
        userId = value;
      }
    });

    if(userId != "" || userId != null) {
      return TodoListPage();
    } else {
      return Container(color: Colors.red,);
    }
  }

  _authGoogle (BuildContext context) {
    var authProvider = context.read<FirebaseAuthenticationRepository>();

    authProvider.isAuthenticated().then((value) {
      log("@!!resultValue: $value");
      if (value) {
        return;
      }
      authProvider.authenticate();
    });

  }
}
