import 'package:flutter/material.dart';
import 'package:flutter_test_provider/auth_model.dart';
import 'package:provider/provider.dart';

import 'menu_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider.value(
                    value: context.read<ImageModel>(),
                    child: MenuPage(),
                  ),
                ),
              );
            },
            child: Text("menu"),
          ),
        ),
      ),
    );
  }
}
