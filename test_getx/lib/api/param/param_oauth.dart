import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_getx/util/device_utils.dart';

part 'param_oauth.g.dart';

@JsonSerializable()
class ParamOAuth {
  String idToken;
  String nationCode = "82";
  int type;
  String os;
  String model;
  String version;
  String token;
  String dateOfBirth;
  String picture;
  int level;
  String gender;
  String mobile;
  String tel;
  String state;
  String city;
  String address;
  String zipCode;
  String bio;
  String manageCode;
  String companyName;
  String companyCode;

  ParamOAuth({
    @required this.idToken,
    @required this.nationCode,
    @required this.type,
    @required this.os,
    @required this.model,
    @required this.version,
    @required this.token,
    @required this.dateOfBirth,
    this.picture,
    @required this.level,
    @required this.gender,
    this.mobile,
    this.tel,
    this.state,
    this.city,
    this.address,
    this.zipCode,
    this.bio,
    @required this.manageCode,
    @required this.companyName,
    @required this.companyCode,
  })  : assert(idToken != null),
        assert(nationCode != null),
        assert(dateOfBirth != null),
        assert(level != null),
        assert(gender != null),
        assert(manageCode != null),
        assert(companyName != null),
        assert(companyCode != null);

  ParamOAuth.fromToken(
      {this.idToken,
      this.os,
      this.model,
      this.version,
      this.token,
      this.dateOfBirth,
      this.level,
      this.gender,
      this.manageCode,
      this.companyName,
      this.companyCode})
      : this.nationCode = "82",
        this.type = DeviceUtils.instance().osCode;

  factory ParamOAuth.fromJson(Map<String, dynamic> map) =>
      _$ParamOAuthFromJson(map);

  Map<String, dynamic> toJson() => _$ParamOAuthToJson(this);
}
