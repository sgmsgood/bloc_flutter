import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  VoidCallback onPressed;
  String buttonTitle;

  LoginButton({this.onPressed, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonTitle));
  }
}
