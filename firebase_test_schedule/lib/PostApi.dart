import 'package:firebase_test_schedule/model/result_contents.dart';

import 'model/date.dart';

class PostApi {
  final Date dates;
  final int page;
  final List<ResultContents> result;
  final int totalPage;
  final int totalResult;

  PostApi({this.dates, this.page, this.result, this.totalPage, this.totalResult});

  factory PostApi.fromJson(Map<String, dynamic> json) {
    return PostApi(
      dates: json['dates'],
      page: json['page'],
      result: json['result'],
      totalPage: json['totalPage'],
      totalResult: json['totalResult'],
    );
  }
}