import 'dart:developer';

import 'package:bloc_todo_cubit/repository.dart';
import 'package:bloc_todo_cubit/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryCubit extends Cubit<ModelState> {
  final RepositoryType _repository;

  RepositoryCubit(this._repository) : super(ModelState.init);

  void add(TodoModel todoModel) {
    emit(ModelState.start);
    log('############---->');
    _repository.create(todoModel);
    emit(ModelState.finish);
  }

  void delete(int index) {

  }

  List<TodoModel> allData() {
    return _repository.all();
  }
}

enum ModelState {
  init, start, finish
}

extension ModelStateExtenstion on ModelState {
  List<TodoModel> getAllData(BuildContext context) {
    return context.read<RepositoryCubit>().allData();
  }
}
