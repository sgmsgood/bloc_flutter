import 'dart:developer';

import 'package:bloc_todo_cubit/repository.dart';
import 'package:bloc_todo_cubit/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryCubit extends Cubit<ModelState> {
  final RepositoryType _repository;

  RepositoryCubit(this._repository) : super(InitialState()) {
    loadAllTodos();
  }

  void loadAllTodos() {
    final todos = _repository.all();
    emit(LoadedAllState(todos));
  }

  void add(TodoModel todoModel) {
    emit(PreparingState());
    _repository.create(todoModel);
    final todos = _repository.all();
    emit(LoadedAllState(todos));
  }

  void delete(int index) {

  }

  void _getTodos() {

  }
}

abstract class ModelState extends Equatable {}

class InitialState extends ModelState {
  @override
  List<Object> get props => [];
}

class LoadedAllState extends ModelState {
  LoadedAllState(this.todos);

  final List<TodoModel> todos;

  @override
  List<Object> get props => [todos];
}

class PreparingState extends ModelState {
  @override
  List<Object> get props => [];
}
