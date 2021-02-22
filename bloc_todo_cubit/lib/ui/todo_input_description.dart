import 'package:flutter/material.dart';

class TodoInputDescription extends StatelessWidget {
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 20),
            _titleInputTextForm(),
            Container(height: 20),
            _raisedButton(),
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

  Widget _raisedButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text("Complete"),
    );
  }
}
