import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    return Scaffold(
      backgroundColor: Color(0xffa56c6f),
      body: SafeArea(
        child: Center(
          child: Container(
            child: _loginWithGoogleButton(context, deviceWidth, deviceHeight)
          ),
        ),
      ),
    );
  }

  Widget _loginWithGoogleButton(
      BuildContext context, double deviceWidth, double deviceHeight) {
    return InkWell(
      child: Container(
        width: deviceWidth / 2,
        height: deviceHeight / 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff4dbde),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/google.png'),
                    fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff46180f)
                ),
              )
            ],
          ),
        )
      ),
      onTap: () async => _authAnonymously(context),
    );
  }

  void _authAnonymously(BuildContext context) async {
    var authModel = context.read<FirebaseAuthModel>();
    log("@!!!authModel: $authModel");
    var signResult = await authModel.signInWithGoogle();

    log("@!!signResult: $signResult");
    if(signResult == null) {
      return;
    }

    _moveToListPage(context);
  }

  void _moveToListPage(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/listPage');
  }
}
