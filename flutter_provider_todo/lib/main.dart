import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_todo/model/todo_repository.dart';
import 'package:flutter_provider_todo/ui/input_todo_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TodoRepository()),
    ], child: MyApp(),),);
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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context),
            Consumer<TodoRepository>(
              builder: (context, todo, child) {
                return _buildListView(todo.todoList);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Provider(create: (context) => InputTodoView(), child: InputTodoView())));
          // Provider(create: (context) => InputTodoView());
        },
        child: Text("Add Schedule"));
  }

  Widget _buildListView(List<dynamic> list) {
    // var todoList = context.watch<TodoRepository>().readAll();
    // log("@!!list: ${list.length}");
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CheckboxListTile(
                value: list[index].isDone,
                title: Text(list[index].title),
                subtitle: Text(list[index].description),
                onChanged: (val) {
                  context.read<TodoRepository>().checkUpdate(index, val);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment(0.75, 0.0),
                  child: IconButton(
                    onPressed: () {
                      context.read<TodoRepository>().delete(index);
                    },
                    icon: Icon(Icons.delete_outlined),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
