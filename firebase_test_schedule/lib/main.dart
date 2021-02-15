import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'PostApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Future<PostApi> fetchPost() async{
    final response = await http.get ('https://api.themoviedb.org/3/movie/upcoming?api_key=e6c5c05f2865ce1dc5b48a66a1e41e91&language=ko-KR&page=1');

    log("@!!response: $response");
    if(response.statusCode == 200) {
      return PostApi.fromJson(json.decode(response.body));
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<PostApi>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.dates.minimum);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // 기본적으로 로딩 Spinner를 보여줍니다.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
