import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'response_aai_certify.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseAAICertify {
  String code;
  String msg;
  int total;
  String errorDesc;
  DATA data;

  ResponseAAICertify();

  factory ResponseAAICertify.fromJson(Map<String, dynamic> map) => _$ResponseAAICertifyFromJson(map);
  Map<String, dynamic> toJson() => _$ResponseAAICertifyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DATA {
  String companyName;
  String companyCode;

  DATA(this.companyName, this.companyCode);

  factory DATA.fromJson(Map<String, dynamic> map) => _$DATAFromJson(map);
  Map<String, dynamic> toJson() => _$DATAToJson(this);
}