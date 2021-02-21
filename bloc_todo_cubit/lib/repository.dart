import 'package:bloc_todo_cubit/todo_model.dart';

abstract class RepositoryType {
  void create(TodoModel todoModel);

  void update(TodoModel todoModel);

  TodoModel read(int index);

  void delete(int index);

  List<TodoModel> search(String keyword);

  List<TodoModel> all();
}

class InMemoryRepository extends RepositoryType {
  List<TodoModel> _data = [];

  @override
  void create(TodoModel todoModel) {
    _data.add(todoModel);
  }

  @override
  void delete(int index) {
    _data.removeAt(index);
  }

  @override
  TodoModel read(int index) {
    return _data[index];
  }

  @override
  List<TodoModel> search(String keyword) {
    return _data.where((element) => element.title.contains(keyword));
  }

  @override
  void update(TodoModel todoModel) {
  }

  @override
  List<TodoModel> all() {
    return _data;
  }
}
