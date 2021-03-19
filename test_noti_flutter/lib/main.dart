import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/pages/main_page.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers:[
        Provider<ScreenSizeProvider>(
          create: (_) => ScreenSizeProvider(),
        ),
        Provider<AnonymousLoginProvider>(
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
      home: TestListPage(),
      // FutureBuilder(
      //   future: Firebase.initializeApp(),
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.waiting) {
      //       return Stack(
      //         children: [
      //           CircularProgressIndicator(),
      //         ],
      //       );
      //     }
      //     if(snapshot.connectionState == ConnectionState.done) {
      //       return TestListPage();
      //     }
      //     return Container(color: Colors.red);
      //   },
      // ),
    );
  }
}
