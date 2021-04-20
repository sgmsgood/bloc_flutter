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
    ..userToken = json['userToken'] as String;
}

Map<String, dynamic> _$ResponseOauthToJson(ResponseOauth instance) =>
    <String, dynamic>{
      'user': instance.user,
      'userToken': instance.userToken,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as String
    ..email = json['email'] as String
    ..name = json['name'] as String
    ..registrationTimestamp = json['registrationTimestamp'] as int
    ..updateTimestamp = json['updateTimestamp'] as int
    ..level = json['level'] as int
    ..deviceType = json['deviceType'] as int
    ..dateOfBirth = json['dateOfBirth'] as String
    ..picture = json['picture'] as String
    ..gender = json['gender'] as String
    ..nationCode = json['nationCode'] as String
    ..mobile = json['mobile'] as String
    ..tel = json['tel'] as String
    ..zipCode = json['zipCode'] as String
    ..bio = json['bio'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'registrationTimestamp': instance.registrationTimestamp,
      'updateTimestamp': instance.updateTimestamp,
      'level': instance.level,
      'deviceType': instance.deviceType,
      'dateOfBirth': instance.dateOfBirth,
      'picture': instance.picture,
      'gender': instance.gender,
      'nationCode': instance.nationCode,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'zipCode': instance.zipCode,
      'bio': instance.bio,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
    };
