import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_getx/api/param/aai/param_certify.dart';

class CertifyingApi {
  Future<http.Response> certify(ParamCertify param) async =>
      await http.post("https://openapi.aaihc.co.kr/aaihc/svccode/",
          headers: {
            "content-type": "application/json"
          },
          body: jsonEncode(param.toJson()),
          encoding: utf8);
}