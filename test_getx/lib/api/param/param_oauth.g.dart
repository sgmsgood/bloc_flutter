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
    dateOfBirth: json['dateOfBirth'] as String,
    picture: json['picture'] as String,
    level: json['level'] as int,
    gender: json['gender'] as String,
    mobile: json['mobile'] as String,
    tel: json['tel'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    address: json['address'] as String,
    zipCode: json['zipCode'] as String,
    bio: json['bio'] as String,
    manageCode: json['manageCode'] as String,
    companyName: json['companyName'] as String,
    companyCode: json['companyCode'] as String,
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
      'dateOfBirth': instance.dateOfBirth,
      'picture': instance.picture,
      'level': instance.level,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'zipCode': instance.zipCode,
      'bio': instance.bio,
      'manageCode': instance.manageCode,
      'companyName': instance.companyName,
      'companyCode': instance.companyCode,
    };
