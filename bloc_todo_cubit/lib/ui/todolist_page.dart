import 'dart:developer';

import 'package:bloc_todo_cubit/ui/todo_input_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository.dart';
import '../repository_cubit.dart';
import '../todo_model.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  _pushInputTitlePage(context);
                },
                child: Text('+'),
              ),
              BlocBuilder<RepositoryCubit, ModelState>(
                builder: (_, state) {
                  if (state is LoadedAllState) {
                    return _buildTodoList(context, state.todos);
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodoList(BuildContext context, List<TodoModel> list) {
    return Column(
      children: [
        Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  CheckboxListTile(
                    value: list[index].isDone,
                    title: Text(list[index].title),
                    subtitle: Text(list[index].description),
                    onChanged: (val) {
                      context.read<RepositoryCubit>().checkUpdate(index, val);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment(0.75, 0.0),
                      child: IconButton(
                        onPressed: () {
                          context.read<RepositoryCubit>().delete(index);
                        },
                        icon: Icon(Icons.delete_outlined),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void _pushInputTitlePage(BuildContext context) {
    var cubit = context.read<RepositoryCubit>();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: TodoInPutTitle(),
              )),
    );
  }
}
