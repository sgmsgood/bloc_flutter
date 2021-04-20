// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dementia_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DementiaQuestion _$DementiaQuestionFromJson(Map<String, dynamic> json) {
  return DementiaQuestion()
    ..notice = (json['notice'] as List)
        ?.map((e) =>
            e == null ? null : Notice.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..question = (json['question'] as List)
        ?.map((e) =>
            e == null ? null : Question.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..result = (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DementiaQuestionToJson(DementiaQuestion instance) =>
    <String, dynamic>{
      'notice': instance.notice,
      'question': instance.question,
      'result': instance.result,
    };

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return Notice()
    ..title = json['title'] as String
    ..score = json['score'] as int;
}

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
  'title': instance.title,
  'score': instance.score,
};


Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question()
    ..questionNum = json['questionNum'] as String
    ..questionContents = json['questionContents'] as String;
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'questionNum': instance.questionNum,
      'questionContents': instance.questionContents,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result()
    ..minScore = json['minScore'] as int
    ..maxScore = json['maxScore'] as int
    ..resultContents = json['resultContents'] as String;
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'minScore': instance.minScore,
      'maxScore': instance.maxScore,
      'resultContents': instance.resultContents,
    };
