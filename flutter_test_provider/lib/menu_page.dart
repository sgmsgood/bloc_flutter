import 'package:flutter/material.dart';
import 'package:flutter_test_provider/auth_model.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthModel>().setLoginState(false);
            },
            child: Text("logout"),
          ),
        ),
      ),
    );
  }
}
