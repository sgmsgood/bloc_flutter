import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/check_is_login.dart';
import 'package:flutter_provider_firebase/ui/todo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:user_authentication/user_authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseAuthenticationRepository>(
            create: (context) => FirebaseAuthenticationRepository()),
        ChangeNotifierProvider<FirebaseTodosRepository>(
            create: (context) => FirebaseTodosRepository()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) {
            var model = context.read<FirebaseAuthenticationRepository>();
           // model.checkAuthenticated();

            return FutureBuilder(
              future: model.checkAuthenticated(),
              builder: (context, snapshot) {
                if(snapshot.connectionState != ConnectionState.done) {
                  return CheckIsLogin();
                }

                return snapshot.data ? TodoListPage() : CheckIsLogin();
              }
            );

            // return Provider<bool>(
            //   create: (_) => model.checkAuthenticated(),
            //   child: (_) => Container(),
            // )
          }
        },
      ),
    );
  }
}
