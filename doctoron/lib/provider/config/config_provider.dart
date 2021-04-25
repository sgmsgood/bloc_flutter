import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider with ChangeNotifier {

  final SharedPreferences prefs;

  ConfigProvider(this.prefs);

  static const String packageName = 'com.opusone.doctoron';

  //UserInfo
  static const String kUserJoined = '$packageName.userJoined';
  static const String kUserId = '$packageName.userId';
  static const String kBearer = '$packageName.bearerCode';
  static const String kUserName = '$packageName.userName';
  static const String kUserEmail = '$packageName.userEmail';
  static const String kUserImage = '$packageName.userImage';

  //Device And App Info
  static const String kFCMToken = '$packageName.FCMToken';
  static const String kDeviceToken = '$packageName.deviceToken';
  static const String kDeviceVersion = '$packageName.deviceVersion';
  static const String kDeviceOS = '$packageName.deviceOS';
  static const String kDeviceModel = '$packageName.deviceModel';
  static const String kAppVersion = '$packageName.appVersion';

  bool get userJoined => prefs?.getBool(kUserJoined) ?? false;

  set userJoined(bool value) {
    prefs?.setBool(kUserJoined, value);
    notifyListeners();
  }

  String get deviceToken => prefs?.getString(kDeviceToken) ?? '';

  set deviceToken(String value) => prefs?.setString(kDeviceToken, value);

  String get fcmToken => prefs?.getString(kFCMToken) ?? '';

  set fcmToken(String value) => prefs?.setString(kFCMToken, value);

  String get appVersion => prefs?.getString(kAppVersion) ?? '';

  set appVersion(String value) => prefs?.setString(kAppVersion, value);

  String get deviceVersion => prefs?.getString(kDeviceVersion) ?? null;

  set deviceVersion(String value) => prefs?.setString(kDeviceVersion, value);

  String get deviceOS => prefs?.getString(kDeviceOS) ?? null;

  set deviceOS(String value) => prefs?.setString(kDeviceOS, value);

  String get deviceModel => prefs?.getString(kDeviceModel) ?? null;

  set deviceModel(String value) => prefs?.setString(kDeviceModel, value);

  void clearConfig() {
    fcmToken = '';
  }

  set logout(bool value) {
    clearConfig();
  }
}
