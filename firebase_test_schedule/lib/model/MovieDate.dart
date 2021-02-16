import 'package:json_annotation/json_annotation.dart';

part 'MovieDate.g.dart';

@JsonSerializable()
class MovieDate {
  final String maximum;
  final String minimum;

  MovieDate({this.maximum, this.minimum});

  factory MovieDate.fromJson(Map<String, dynamic> json) => _$MovieDateFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDateToJson(this);
}