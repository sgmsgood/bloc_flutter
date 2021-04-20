import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'dementia_question.g.dart';

@JsonSerializable()
class DementiaQuestion {
  List<Notice> notice;
  List<Question> question;
  List<Result> result;

  DementiaQuestion();

  factory DementiaQuestion.fromJson(Map<String, dynamic> map) =>
      _$DementiaQuestionFromJson(map);

  Map<String, dynamic> toJson() => _$DementiaQuestionToJson(this);
}

class Notice {
  String title;
  int score;

  Notice();

  factory Notice.fromJson(Map<String, dynamic> map) =>
      _$NoticeFromJson(map);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}

@JsonSerializable()
class Question{
  String questionNum;
  String questionContents;

  Question();

  factory Question.fromJson(Map<String, dynamic> map) =>
      _$QuestionFromJson(map);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Result {
  int minScore;
  int maxScore;
  String resultContents;

  Result();

  factory Result.fromJson(Map<String, dynamic> map) =>
      _$ResultFromJson(map);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}