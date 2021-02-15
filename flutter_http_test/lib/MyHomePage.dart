import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<http.Response> fetchPost() async {
    return http.get('https://yts.mx/api/v2/list_movies.json');
  }
}
