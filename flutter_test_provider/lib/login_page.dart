import 'package:flutter/material.dart';
import 'package:flutter_test_provider/auth_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              context.watch<ImageModel>().isShow() ? Icon(Icons.image, size: 200,) : Container() ,
              SizedBox(height: 16,),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthModel>().setLoginState(true);
                  },
                  child: Text("login"),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    var imageModel = context.read<ImageModel>();
                    imageModel.setImageShow(!imageModel.isShow());
                  },
                  child: Text("show/hide"),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
