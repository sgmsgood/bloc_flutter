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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context),
            _buildListView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          context.read<TodoRepository>().add(Todo(false, "Take a Breakfast", "Grilled Chicken Salad"));
        },
        child: Text("Add Schedule"));
  }

  Widget _buildListView(BuildContext context) {
    var todoList = context.watch<TodoRepository>().readAll();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CheckboxListTile(
                value: todoList[index].isDone,
                title: Text(todoList[index].title),
                subtitle: Text(todoList[index].description),
                onChanged: (val) {
                  context.read<TodoRepository>().delete(index);
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
