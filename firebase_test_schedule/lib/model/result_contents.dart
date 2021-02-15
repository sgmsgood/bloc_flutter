class ResultContents {
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

  ResultContents(
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

  factory ResultContents.fromJson(Map<String, dynamic> json) {
    return ResultContents(
      adult: json['adult'],
      backImgPath: json['backImgPath'],
      genreIds: json['genreIds'],
      id: json['id'],
      originLang: json['originLang'],
      originTitle: json['originTitle'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['posterPath'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      video: json['video'],
      voteAvg: json['voteAvg'],
      voteCount: json['voteCount'],
    );
  }
}
