import 'package:json_annotation/json_annotation.dart';

part 'param_app_run_count.g.dart';

@JsonSerializable()
class ParamAppRunCount {
  String userToken;
  String packageName;
  String displayName;

  ParamAppRunCount(
    this.userToken,
    this.packageName,
    this.displayName,
  );

  factory ParamAppRunCount.fromJson(Map<String, dynamic> map) =>
      _$ParamAppRunCountFromJson(map);

  Map<String, dynamic> toJson() => _$ParamAppRunCountToJson(this);
}
