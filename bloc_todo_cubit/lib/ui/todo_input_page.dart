import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository_cubit.dart';
import '../todo_model.dart';

class TodoInputPage extends StatelessWidget {
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryCubit, ModelState>(
      builder: (_, state) {
        if (state is LoadedAllState) {
          return _buildInput(context);
        } else {
          return Container();
        }
      },
    );
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
              controller: title,
            ),
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              controller: description,
            ),
            Container(height: 20),
            RaisedButton(
              onPressed: () {
                context
                    .read<RepositoryCubit>()
                    .add(TodoModel(false, title.text, description.text));
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.of(context)
                    .popAndPushNamed('/')
                    .then((value) => context.read<RepositoryCubit>());
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
