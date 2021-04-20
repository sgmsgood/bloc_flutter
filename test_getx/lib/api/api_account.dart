import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_getx/api/param/param_oauth.dart';
import 'package:test_getx/api/param/param_user_token.dart';

import 'base/api_header.dart';
import 'base/api_url.dart';

class AccountApi {
  Future<http.Response> oauth(ParamOAuth param) async =>
      await http.post(ApiUrl.getUrl('/account/oauth'),
          headers: ApiHeader.header,
          body: jsonEncode(param.toJson()),
          encoding: utf8);

  Future<http.Response> signout(ParamUserToken param) async =>
      await http.post(ApiUrl.getUrl('/account/signout'),
          headers: ApiHeader.header,
          body: jsonEncode(param.toJson()),
          encoding: utf8);
}
