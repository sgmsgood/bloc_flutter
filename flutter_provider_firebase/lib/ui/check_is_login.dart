import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class CheckIsLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("@!!isAuth?: $getisAuthenticated");
    return Container();
  }

  bool getisAuthenticated(BuildContext context) {
    var result;
    Provider
        .of<FirebaseAuthenticationRepository>(context)
        .isAuthenticated()
        .then((value) {
      log("@!!result: $value");
      result = value;
    });

    return result;
  }
}
