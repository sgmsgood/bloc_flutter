import 'package:bloc_todo_cubit/repository.dart';
import 'package:bloc_todo_cubit/repository_cubit.dart';
import 'package:bloc_todo_cubit/ui/todo_input_page.dart';
import 'package:bloc_todo_cubit/ui/todolist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => RepositoryCubit(InMemoryRepository()),
              child: TodoListPage(),
            ),
        '/input': (context) => BlocProvider(
              create: (context) => RepositoryCubit(InMemoryRepository()),
              child: TodoInputPage(),
            ),
      },
    );
  }
}
