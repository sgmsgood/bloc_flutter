import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/login_view.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:user_authentication/user_authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider<FirebaseAuthModel>(
      create: (context) => FirebaseAuthModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("@!!isAuth: ${context.read<FirebaseAuthModel>().isAuth()}");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => context.read<FirebaseAuthModel>().isAuth() ? TodoListPage() :  LoginView(),
        '/loginPage': (context) => LoginView(),
        '/listPage': (context) => TodoListPage(),
      },
    );
  }
}
