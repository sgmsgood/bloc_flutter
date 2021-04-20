import 'package:json_annotation/json_annotation.dart';

part 'response_app_run_count.g.dart';

@JsonSerializable()
class ResponseAppRunCount {
  String packageName;
  String displayName;
  int count;
  int updateTimestamp;

  ResponseAppRunCount();
  factory ResponseAppRunCount.fromJson(Map<String, dynamic> map) => _$ResponseAppRunCountFromJson(map);
  Map<String, dynamic> toJson() => _$ResponseAppRunCountToJson(this);
}