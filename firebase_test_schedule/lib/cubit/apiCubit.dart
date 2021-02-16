import 'dart:html';

import 'package:firebase_test_schedule/model/Movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCubit extends Cubit<Movie> {
  ApiCubit() : super(null);

  void request() async {
    //
    final response = await http.get ('https://api.themoviedb.org/3/movie/upcoming?api_key=e6c5c05f2865ce1dc5b48a66a1e41e91&language=ko-KR&page=1');
    //
    if(response.statusCode == 200) {
      var jsonResponse = Movie.fromJson(json.decode(response.body));
      emit(jsonResponse);
    }
  }
}


