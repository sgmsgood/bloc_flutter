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
    return _todoList;
  }

  void delete(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  void checkUpdate(int index, bool isChecked) {
    if (_todoList.length != index) {
      _todoList.insert(index, Todo(
          isChecked, _todoList[index].title, _todoList[index].description));
      _todoList.removeAt(index + 1);
    }
    notifyListeners();
  }
}
