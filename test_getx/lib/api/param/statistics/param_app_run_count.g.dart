// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_app_run_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamAppRunCount _$ParamAppRunCountFromJson(Map<String, dynamic> json) {
  return ParamAppRunCount(
    json['userToken'] as String,
    json['packageName'] as String,
    json['displayName'] as String,
  );
}

Map<String, dynamic> _$ParamAppRunCountToJson(ParamAppRunCount instance) =>
    <String, dynamic>{
      'userToken': instance.userToken,
      'packageName': instance.packageName,
      'displayName': instance.displayName,
    };
