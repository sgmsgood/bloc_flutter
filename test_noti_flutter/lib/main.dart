import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/components/circular_progress.dart';
import 'package:test_noti_flutter/pages/main_list_page.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<ScreenSizeProvider>(
          create: (_) => ScreenSizeProvider(),
        ),
        ChangeNotifierProvider<AnonymousLoginProvider>(
          create: (_) => AnonymousLoginProvider(),
        ),
      ],
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
      home: FutureBuilder(
        future: context.read<AnonymousLoginProvider>().authenticate(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return MainListPage();
          }

          return CircularProgressPage();
        }
      ),
    );
  }
}
