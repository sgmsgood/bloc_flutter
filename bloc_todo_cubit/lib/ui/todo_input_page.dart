import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository_cubit.dart';

class TodoInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryCubit, ModelState>(builder: (_, state) {
      return _buildInput();
    });
  }

  Widget _buildInput() {
    return Container(
      child: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Hint',
              )
          ),
        ],
      ),
    );
  }
}
