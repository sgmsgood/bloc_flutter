// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    dates: json['dates'] == null
        ? null
        : MovieDate.fromJson(json['dates'] as Map<String, dynamic>),
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieContent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalPage: json['totalPage'] as int,
    totalResult: json['totalResult'] as int,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'dates': instance.dates?.toJson(),
      'page': instance.page,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
      'totalPage': instance.totalPage,
      'totalResult': instance.totalResult,
    };
