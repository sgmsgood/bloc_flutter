import 'package:json_annotation/json_annotation.dart';

part 'param_certify.g.dart';

@JsonSerializable()
class ParamCertify {
  String key;
  List<Map<String, String>> data;

  ParamCertify(this.key, this.data);

  factory ParamCertify.fromJson(Map<String, dynamic> map) =>
      _$ParamCertifyFromJson(map);
  Map<String, dynamic> toJson() => _$ParamCertifyToJson(this);
}