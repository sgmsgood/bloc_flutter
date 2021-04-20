// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_aai_certify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAAICertify _$ResponseAAICertifyFromJson(Map<String, dynamic> json) {
  return ResponseAAICertify()
    ..code = json['CODE'] as String
    ..msg = json['MSG'] as String
    ..total = json['TOTAL'] as int
    ..errorDesc = json['ERRORDESC'] as String
    ..data = json['DATA'] == null ? null : ['DATA'] == null ? null
        : DATA.fromJson(json['DATA']['DATA'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResponseAAICertifyToJson(ResponseAAICertify instance) {
  return <String, dynamic>{
    'CODE': instance.code,
    'MSG': instance.msg,
    'TOTAL': instance.total,
    'ERRORDESC': instance.errorDesc,
    'DATA': {'DATA': {
      'company_name' : instance.data.companyName,
      'company_code' : instance.data.companyCode,
    }}
  };
}

DATA _$DATAFromJson(Map<String, dynamic> json) {
  return DATA(
    json['company_name'] as String,
    json['company_code'] as String,
  );
}

Map<String, dynamic> _$DATAToJson(DATA instance) => <String, dynamic>{
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
    };
