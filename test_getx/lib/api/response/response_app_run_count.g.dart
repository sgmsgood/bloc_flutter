// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_app_run_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAppRunCount _$ResponseAppRunCountFromJson(Map<String, dynamic> json) {
  return ResponseAppRunCount()
    ..packageName = json['packageName'] as String
    ..displayName = json['displayName'] as String
    ..count = json['count'] as int
    ..updateTimestamp = json['updateTimestamp'] as int;
}

Map<String, dynamic> _$ResponseAppRunCountToJson(
        ResponseAppRunCount instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'displayName': instance.displayName,
      'count': instance.count,
      'updateTimestamp': instance.updateTimestamp,
    };
