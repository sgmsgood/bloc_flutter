import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_getx/api/param/statistics/param_app_run_count.dart';
import 'base/api_header.dart';
import 'base/api_url.dart';

class StatisticApi {
  Future<http.Response> countAppRun(ParamAppRunCount param) async =>
      await http.post(ApiUrl.getUrl('/statistic/appRunCount'),
          headers: ApiHeader.header,
          body: jsonEncode(param.toJson()),
          encoding: utf8);
}