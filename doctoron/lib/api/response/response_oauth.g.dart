// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_oauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseOauth _$ResponseOauthFromJson(Map<String, dynamic> json) {
  return ResponseOauth()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..bearerToken = json['bearerToken'] as String;
}

Map<String, dynamic> _$ResponseOauthToJson(ResponseOauth instance) =>
    <String, dynamic>{
      'user': instance.user,
      'bearerToken': instance.bearerToken,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..email = json['email'] as String
    ..name = json['name'] as String
    ..identityNumber = json['identityNumber'] as String
    ..mobile = json['mobile'] as String
    ..gender = json['gender'] as String
    ..registrationTimestamp = json['registrationTimestamp'] as int
    ..updateTimestamp = json['updateTimestamp'] as int
    ..level = json['level'] as int
    ..deviceType = json['deviceType'] as int
    ..termAgreed = json['termAgreed'] as bool
    ..picture = json['picture'] as String
    ..secret = json['secret'] as String
    ..nationCode = json['nationCode'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'email': instance.email,
  'name': instance.name,
  'identityNumber': instance.identityNumber,
  'mobile': instance.mobile,
  'gender': instance.gender,
  'registrationTimestamp': instance.registrationTimestamp,
  'updateTimestamp': instance.updateTimestamp,
  'level': instance.level,
  'deviceType': instance.deviceType,
  'termAgreed': instance.termAgreed,
  'picture': instance.picture,
  'secret': instance.secret,
  'nationCode': instance.nationCode,
};
