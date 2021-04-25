import 'package:doctoron/util/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'param_oauth.g.dart';

@JsonSerializable()
class ParamOAuth {
  String idToken;
  String nationCode = '82';
  int type;
  String os;
  String model;
  String version;
  String token = 'none';
  String identityNumber;
  String mobile;
  String gender;

  ParamOAuth({
    @required idToken,
    @required nationCode,
    @required type,
    @required os,
    @required model,
    @required version,
    @required token,
    identityNumber,
    mobile,
    gender,
  })  : assert(idToken != null),
        assert(nationCode != null),
        assert(token != null);

  ParamOAuth.fromToken(
      {this.idToken,
      this.os,
      this.model,
      this.version,
      this.token,
      this.identityNumber,
      this.mobile,
      this.gender})
      : this.nationCode = "82",
        this.type = DeviceUtils.instance().osCode;

  factory ParamOAuth.fromJson(Map<String, dynamic> map) =>
      _$ParamOAuthFromJson(map);

  Map<String, dynamic> toJson() => _$ParamOAuthToJson(this);
}
