import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/pages/main_page.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

void main() {
  runApp(
    Provider<ScreenSizeProvider>(
      create: (_) => ScreenSizeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestListPage(),
    );
  }
}
