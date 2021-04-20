// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_certify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamCertify _$ParamCertifyFromJson(Map<String, dynamic> json) {
  return ParamCertify(
    json['key'] as String,
    json['data'] as List<Map<String, String>>,
  );
}

Map<String, dynamic> _$ParamCertifyToJson(ParamCertify instance) =>
    <String, dynamic>{
      'key': instance.key,
      'data': instance.data,
    };