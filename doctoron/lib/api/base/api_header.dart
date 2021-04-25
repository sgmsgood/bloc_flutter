import 'dart:io';


class ApiHeader {
  static Map<String, String> getHeader(String authorization) => Map.from({
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: '$authorization'
      });
}
