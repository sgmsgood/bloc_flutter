// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_oauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamOAuth _$ParamOAuthFromJson(Map<String, dynamic> json) {
  return ParamOAuth(
    idToken: json['idToken'] as String,
    nationCode: json['nationCode'] as String,
    type: json['type'] as int,
    os: json['os'] as String,
    model: json['model'] as String,
    version: json['version'] as String,
    token: json['token'] as String,
    identityNumber: json['identityNumber'] as String,
    mobile: json['mobile'] as String,
    gender: json['gender'] as String
  );
}

Map<String, dynamic> _$ParamOAuthToJson(ParamOAuth instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'nationCode': instance.nationCode,
      'type': instance.type,
      'os': instance.os,
      'model': instance.model,
      'version': instance.version,
      'token': instance.token,
      'identityNumber': instance.identityNumber,
      'mobile': instance.mobile,
      'gender': instance.gender
    };
