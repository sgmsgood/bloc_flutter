import 'package:flutter/material.dart';

import 'Todo.dart';

class TodoRepository with ChangeNotifier {
  List<Todo> _todoList = [];

  List get todoList => _todoList;

  void add(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  List<Todo> readAll() {
    if(_todoList.isNotEmpty || _todoList != null) {
      return _todoList;
    }
  }
}