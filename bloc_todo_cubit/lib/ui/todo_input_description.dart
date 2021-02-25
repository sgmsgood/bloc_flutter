import 'dart:developer';

import 'package:bloc_todo_cubit/repository_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo_model.dart';

class TodoInputDescription extends StatelessWidget {
  TodoInputDescription({this.title});

  final String title;

  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("@!!title: $title");
    return BlocBuilder<RepositoryCubit, ModelState>(
      builder: (_, state) {
        if (state is LoadedAllState) {
          return _buildInputDescription(context);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildInputDescription(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 20),
            _titleInputTextForm(),
            Container(height: 20),
            _raisedButton(context),
          ],
        ),
      ),
    );
  }

  Widget _titleInputTextForm() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Description',
      ),
      controller: description,
    );
  }

  Widget _raisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        context
            .read<RepositoryCubit>()
            .add(TodoModel(false, title, description.text));
        Navigator.popUntil(context, ModalRoute.withName('/'));
      },
      child: Text("Complete"),
    );
  }
}
