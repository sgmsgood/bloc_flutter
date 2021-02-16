// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieContent _$MovieContentFromJson(Map<String, dynamic> json) {
  return MovieContent(
    adult: json['adult'] as bool,
    backImgPath: json['backImgPath'] as String,
    genreIds: (json['genreIds'] as List)?.map((e) => e as int)?.toList(),
    id: json['id'] as int,
    originLang: json['originLang'] as String,
    originTitle: json['originTitle'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['posterPath'] as String,
    releaseDate: json['releaseDate'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    voteAvg: (json['voteAvg'] as num)?.toDouble(),
    voteCount: json['voteCount'] as int,
  );
}

Map<String, dynamic> _$MovieContentToJson(MovieContent instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backImgPath': instance.backImgPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originLang': instance.originLang,
      'originTitle': instance.originTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAvg': instance.voteAvg,
      'voteCount': instance.voteCount,
    };
