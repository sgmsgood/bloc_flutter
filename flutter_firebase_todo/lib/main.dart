import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_todo/blocs/simple_bloc_observer.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:todos_repository/todos_repository.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/authentication_bloc/authentication_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  runApp(TodosApp());
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthenticationBloc>(create: (context) {
        return AuthenticationBloc(
          userRepository: FirebaseUserRepository₩(),
        )
          ..add(AppStarted());
      },),
      BlocProvider(create: (context){
        return TodosBloc(
          todosRepository: FirebaseTodosRepository(),
        )..add(LoadTodos());
      })
    ], child:MaterialApp(
      title: 'Firestore Todos',
      routes: {
        '/': (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<TabBloc>(
                      create: (context) => TabBloc(),
                    ),
                    BlocProvider<FilteredTodosBloc>(
                      create: (context) => FilteredTodosBloc(
                        todosBloc: BlocProvider.of<TodosBloc>(context),
                      ),
                    ),
                    BlocProvider<StatsBloc>(
                      create: (context) => StatsBloc(
                        todosBloc: BlocProvider.of<TodosBloc>(context),
                      ),
                    ),
                  ],
                  child: HomeScreen(),
                );
              }
              if (state is Unauthenticated) {
                return Center(
                  child: Text('Could not authenticate with Firestore'),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
        '/addTodo': (context) {
          return AddEditScreen(
            onSave: (task, note) {
              BlocProvider.of<TodosBloc>(context).add(
                AddTodo(Todo(task, note: note)),
              );
            },
            isEditing: false,
          );
        },
      },
    ),
    );
  }
}

