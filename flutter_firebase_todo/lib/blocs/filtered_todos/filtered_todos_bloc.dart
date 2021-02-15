
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_todo/blocs/filtered_todos/filtered_todos.dart';

import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:flutter_firebase_todo/blocs/todos/todos.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent> {
  final TodosBloc _todosBloc;
  StreamSubscription _todosSubscription;

  FilteredTodosBloc({@required TodosBloc todosBloc})
      : assert(todosBloc != null),
        _todosBloc = todosBloc,
        super(todosBloc.state is TodosLoaded
            ? FilteredTodosLoaded(
                (todosBloc.state as TodosLoaded).todos,
                VisiblitityFilter.all,
              )
            : FilteredTodosLoading()) {
    _todosSubscription = todosBloc.listen((state) {
      if (state is TodosLoaded) {
        add(UpdateTodos((todosBloc.state as TodosLoaded).todos));
      }
    });
  }

  @override
  Stream<FilteredTodosState> mapEventToState(FilteredTodosEvent event) async* {
    if (event is UpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is UpdateTodos) {
      yield* _mapTodosUpdatedToState(event);
    }
  }

  Stream<FilteredTodosState> _mapUpdateFilterToState(
      UpdateFilter event,
      ) async* {
    final currentState = _todosBloc.state;
    if (currentState is TodosLoaded) {
      yield FilteredTodosLoaded(
        _mapTodosToFilteredTodos(currentState.todos, event.filter),
        event.filter,
      );
    }
  }

  Stream<FilteredTodosState> _mapTodosUpdatedToState(
      UpdateTodos event,
      ) async* {
    final visibilityFilter = state is FilteredTodosLoaded
        ? (state as FilteredTodosLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredTodosLoaded(
      _mapTodosToFilteredTodos(
        (_todosBloc.state as TodosLoaded).todos,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<Todo> _mapTodosToFilteredTodos(
      List<Todo> todos, VisibilityFilter filter) {
    return todos.where((todo) {
      if (filter == VisiblityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return !todo.complete;
      } else {
        return todo.complete;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
