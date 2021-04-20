// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBase _$ApiBaseFromJson(Map<String, dynamic> json) {
  return ApiBase()
    ..status = json['status'] as String
    ..timestamp = json['timestamp'] as int
    ..data = json['data'] as Map<String, dynamic>
    ..error = json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ApiBaseToJson(ApiBase instance) => <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp,
      'data': instance.data,
      'error': instance.error,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse()
    ..code = json['code'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ApiBaseList _$ApiBaseListFromJson(Map<String, dynamic> json) {
  return ApiBaseList()
    ..status = json['status'] as String
    ..timestamp = json['timestamp'] as int
    ..data =
        (json['data'] as List)?.map((e) => e as Map<String, dynamic>)?.toList()
    ..error = json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ApiBaseListToJson(ApiBaseList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp,
      'data': instance.data,
      'error': instance.error,
    };
