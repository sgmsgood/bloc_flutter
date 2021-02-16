
import 'package:json_annotation/json_annotation.dart';

part 'MovieContent.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class MovieContent {
  final bool adult;
  final String backImgPath;
  final List<int> genreIds;
  final int id;
  final String originLang;
  final String originTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAvg;
  final int voteCount;

  MovieContent(
      {this.adult,
      this.backImgPath,
      this.genreIds,
      this.id,
      this.originLang,
      this.originTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAvg,
      this.voteCount});

  factory MovieContent.fromJson(Map<String, dynamic> json) => _$MovieContentFromJson(json);
  Map<String, dynamic> toJson() => _$MovieContentToJson(this);
}
