import 'dart:convert';

import 'package:doctoron/api/param/auth/param_oauth.dart';
import 'package:http/http.dart' as http;

import 'base/api_header.dart';
import 'base/api_url.dart';

final String API_KEY = 'key:ko4wQEwYmKuKbTFWLDdG3G';

class AccountApi {
  Future<http.Response> oauth(ParamOAuth param) async {
    return await http.post(ApiUrl.getUrl('/auth/oauth'),
        headers: ApiHeader.getHeader(API_KEY),
        body: jsonEncode(param.toJson()),
        encoding: utf8);
  }
}