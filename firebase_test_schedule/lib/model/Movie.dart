import 'package:firebase_test_schedule/model/MovieContent.dart';
import 'package:json_annotation/json_annotation.dart';

import 'MovieDate.dart';


part 'Movie.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class Movie {
  final MovieDate dates;
  final int page;
  final List<MovieContent> results;
  final int totalPage;
  final int totalResult;

  Movie({ this.dates, this.page, this.results, this.totalPage, this.totalResult});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}