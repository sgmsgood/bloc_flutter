import 'package:json_annotation/json_annotation.dart';

part 'response_oauth.g.dart';

@JsonSerializable()
class ResponseOauth {

  User user;
  String bearerToken;

  ResponseOauth();
  factory ResponseOauth.fromJson(Map<String, dynamic> map) => _$ResponseOauthFromJson(map);
  Map<String, dynamic> toJson() => _$ResponseOauthToJson(this);
}

@JsonSerializable()
class User {
  String id;
  String uid;
  String email;
  String name;
  String identityNumber;
  String mobile;
  String gender;
  int registrationTimestamp;
  int updateTimestamp;
  int level;
  int deviceType;
  bool termAgreed;
  String picture;
  String secret;
  String nationCode;

  User();
  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
