import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository_cubit.dart';
import '../todo_model.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RaisedButton(onPressed: () {
              Navigator.pushNamed(context, '/input');
            },
            child: Text('+'),),
            BlocBuilder<RepositoryCubit, ModelState>(builder: (_, state) {
              if (state is LoadedAllState) {
                return _buildTodoList(context, state.todos);
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoList(BuildContext context, List<TodoModel> list) {
    return Column(
      children: [
        Container(
          height: 500,
          child: ListView.builder(
            itemBuilder: (context, index) => Text(list[index].description),
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}
