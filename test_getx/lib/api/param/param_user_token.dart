import 'package:json_annotation/json_annotation.dart';

part 'param_user_token.g.dart';

@JsonSerializable()
class ParamUserToken {
  final String userToken;

  ParamUserToken(this.userToken);

  factory ParamUserToken.fromJson(Map<String,dynamic> map) => _$ParamUserTokenFromJson(map);
  Map<String, dynamic> toJson() => _$ParamUserTokenToJson(this);
}
