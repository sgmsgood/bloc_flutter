import 'package:bloc_todo_cubit/ui/todo_input_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository.dart';
import '../repository_cubit.dart';

class TodoInPutTitle extends StatelessWidget {
  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryCubit, ModelState>(
      builder: (_, state) {
        if (state is LoadedAllState) {
          return _buildInputTitle(context);
        } else {
          return Container();
        }
      },
    );

  }

  Widget _buildInputTitle(BuildContext context){
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
        labelText: 'Title',
      ),
      controller: title,
    );
  }

  Widget _raisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _pushInputDescriptionPage(context);
      },
      child: Text("Next"),
    );
  }

  void _pushInputDescriptionPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RepositoryCubit(context.read<InMemoryRepository>()),
            child: TodoInputDescription(),
          )
      ),
    );
  }
}
