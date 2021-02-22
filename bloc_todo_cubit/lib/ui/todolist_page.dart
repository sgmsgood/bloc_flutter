import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository_cubit.dart';
import '../todo_model.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            height: double.maxFinite,
            child: Expanded(
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/input');
                    },
                    child: Text('+'),
                  ),
                  BlocBuilder<RepositoryCubit, ModelState>(
                    builder: (_, state) {
                      log("@!!listPageState: $state");
                      if (state is LoadedAllState) {
                        log("@!!LoadedAllState");
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
        ),
      ),
    );
  }

  Widget _buildTodoList(BuildContext context, List<TodoModel> list) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Container(
            height: 700,
            child: ListView.builder(
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
      ),
    );
  }
}
