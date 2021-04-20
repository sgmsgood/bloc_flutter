import 'package:json_annotation/json_annotation.dart';

part 'response_oauth.g.dart';

@JsonSerializable()
class ResponseOauth {

  User user;
  String userToken;

  ResponseOauth();
  factory ResponseOauth.fromJson(Map<String, dynamic> map) => _$ResponseOauthFromJson(map);
  Map<String, dynamic> toJson() => _$ResponseOauthToJson(this);
}

@JsonSerializable()
class User {
  String id;
  String email;
  String name;
  int registrationTimestamp;
  int updateTimestamp;
  int level;
  int deviceType;
  String dateOfBirth;
  String picture;
  String gender;
  String nationCode;
  String mobile;
  String tel;
  String zipCode;
  String bio;
  String state;
  String city;
  String address;

  User();
  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
