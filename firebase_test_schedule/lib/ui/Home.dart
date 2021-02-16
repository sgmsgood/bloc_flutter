import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../model/Movie.dart';

class Home extends StatelessWidget {
  Future<Movie> fetchPost() async{
    final response = await http.get ('https://api.themoviedb.org/3/movie/upcoming?api_key=e6c5c05f2865ce1dc5b48a66a1e41e91&language=ko-KR&page=1');

    log("@!!response: ${response.statusCode}");
    if(response.statusCode == 200) {
      var jsonResponse = Movie.fromJson(json.decode(response.body));
      log("@!!jsonResponse: ${jsonResponse.results.last.title}");
      return jsonResponse;
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
          child: FutureBuilder<Movie>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data.dates.minimum),
                    Text(snapshot.data.dates.maximum),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Sorry Don't have Data ~_~");
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
