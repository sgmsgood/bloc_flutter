import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/add_todo_page.dart';
import 'package:flutter_provider_firebase/ui/login_view.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';

import 'model/firebase_auth_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider<FirebaseAuthModel>(
      create: (context) => FirebaseAuthModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
  var authModel = context.read<FirebaseAuthModel>();
    log("@!!log: authModel: $authModel");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/loginPage': (context) => LoginView(),
        '/listPage': (context) => TodoListPage(),
      },
      home: FutureBuilder(
        future: _initialFirebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return LoginView();
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return TodoListPage();
          }
          // Otherwise, show something whilst waiting for initialization to complete
          return AddTodoPage();
        },
      ),
    );
  }
}