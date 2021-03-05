import 'package:flutter/material.dart';
import 'package:flutter_test_provider/auth_model.dart';
import 'package:flutter_test_provider/login_page.dart';
import 'package:flutter_test_provider/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthModel(),
      child: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var model = context.read<AuthModel>();
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder<bool>(
//         future: model.loadLoginState(),
//         builder: (context, snapshot) {
//           return Consumer<AuthModel>(
//               builder: (context, model, child) {
//                 return model.isLogin() ? MainPage() : LoginPage();
//               },
//               child: LoginPage());
//         },
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.read<AuthModel>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<AuthModel>(
        builder: (context, model, child) {
          return model.isLogin()
              ? MainPage()
              : ChangeNotifierProvider(
                  create: (_) => ImageModel(),
                  child: LoginPage(),
                );
        },
        child: LoginPage(),
      ),
    );
  }
}
