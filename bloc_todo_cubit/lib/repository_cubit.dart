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
    final todos = _repository.all();
    emit(PreparingState());
    _repository.create(todoModel);
    emit(LoadedAllState(todos));
  }

  void delete(int index) {
    final todos = _repository.all();
    emit(PreparingState());
    _repository.delete(index);
    emit(LoadedAllState(todos));
  }

  void checkUpdate(int index, bool val) {
    final todos = _repository.all();
    emit(PreparingState());
    _repository.checkUpdate(index, val);
    emit(LoadedAllState(todos));
  }

  @override
  void onChange(Change<ModelState> change) {
    super.onChange(change);
    log("@!!change: $change");
  }

  @override
  Future<void> close() {
    log("@!!closed!!!!!!!!!");
    return super.close();
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
