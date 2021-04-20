import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiBase {
  String status;
  int timestamp;
  Map<String, dynamic> data;
  ErrorResponse error;

  bool get isSucceed => status == "ok";

  ApiBase();
  factory ApiBase.fromJson(Map<String, dynamic> map) => _$ApiBaseFromJson(map);
  Map<String, dynamic> toJson() => _$ApiBaseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  int code;
  String message;

  ErrorResponse();
  factory ErrorResponse.fromJson(Map<String, dynamic> map) =>
      _$ErrorResponseFromJson(map);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  String toString() {
    return 'ErrorResponse{code: $code, message: $message}';
  }
}

@JsonSerializable()
class ApiBaseList {
  String status;
  int timestamp;
  List<Map<String, dynamic>> data;
  ErrorResponse error;

  bool get isSucceed => status == "ok";

  ApiBaseList();
  factory ApiBaseList.fromJson(Map<String, dynamic> map) =>
      _$ApiBaseListFromJson(map);
  Map<String, dynamic> toJson() => _$ApiBaseListToJson(this);
}
