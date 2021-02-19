import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository_cubit.dart';
import '../todo_model.dart';

class TodoInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryCubit, ModelState>(builder: (_, state) {
      log("@!!state: $state");
      if(state is LLLL) {
        log("@!!state.todos: ${state.todos.length}");
        return _buildInput(context);
      } else {
        return Container();
      }
    });
  }

  Widget _buildInput(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            Container(height: 20),
            RaisedButton(
              onPressed: () {
                context.read<RepositoryCubit>().add(TodoModel(false, "haha", "wow"));
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
