import 'package:flutter/material.dart';
import 'package:flutter_provider_todo/model/todo_repository.dart';
import 'package:provider/provider.dart';

import 'model/Todo.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => TodoRepository(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return RaisedButton(onPressed: () {
      context.read<TodoRepository>().add(Todo(false, "23일에는", "무엇을 합니까"));
    }, child: Text("Add Schedule"));
  }


}
