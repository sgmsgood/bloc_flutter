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
              Consumer<ImageModel>(
                builder: (context, model, child) {
                  return model.isShow() ? child : Container(height: 200);
                },
                child: Icon(Icons.image, size: 200,)
              ),
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
