import 'package:flutter/material.dart';
import 'package:flutter_provider_todo/model/Todo.dart';
import 'package:flutter_provider_todo/model/todo_repository.dart';
import 'package:provider/provider.dart';

class InputTodoView extends StatelessWidget {
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              controller: title,
            ),
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              controller: description,
            ),
            Container(height: 20),
            RaisedButton(
              onPressed: () {
                Consumer<TodoRepository>(context, listen: true).add(Todo(false, title.text, description.text));
                Navigator.popUntil(context, (route) => false);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
