import 'dart:developer';

import 'package:bloc_todo_cubit/repository.dart';
import 'package:bloc_todo_cubit/repository_cubit.dart';
import 'package:bloc_todo_cubit/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => RepositoryCubit(InMemoryRepository()),
        child: BlocBuilder<RepositoryCubit, ModelState>(
          builder: (ctx, state) => HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context
                      .read<RepositoryCubit>()
                      .add(TodoModel(false, '밥먹기', '두번먹어'),);
                },
                child: Text("추가"),
              ),
              BlocBuilder<RepositoryCubit, ModelState>(
                cubit: BlocProvider.of<RepositoryCubit>(context),
                builder: (context, state) => _buildTodoList(context, state),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodoList(BuildContext context, ModelState state) {
    log('############# ${state.getAllData(context).length}');
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) => Text("test"),
        itemCount: state.getAllData(context).length,
      ),
    );
  }
}
