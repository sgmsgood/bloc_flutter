library device_utils;

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:test_getx/controller/oauth/config_controller.dart';

class DeviceUtils {
  static final DeviceUtils _instance = DeviceUtils._();

  AndroidDeviceInfo androidDeviceInfo;
  IosDeviceInfo iosDeviceInfo;

  String version;
  String deviceModel;
  String os;

  DeviceUtils._();

  factory DeviceUtils.instance() => _instance;

  Future<void> init(ConfigController config) async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      androidDeviceInfo = androidInfo;
      this.os = "Android";
      this.version = androidInfo.version.sdkInt.toString();
      this.deviceModel = androidInfo.model;

      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var codeName = androidInfo.version.codename;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;

      print('Android $release (SDK $sdkInt $codeName), $manufacturer $model');
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      iosDeviceInfo = iosInfo;
      this.os = "iOS";
      this.version = iosInfo.systemVersion;
      this.deviceModel = iosInfo.utsname.machine;

      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.utsname.machine;
      var model = iosInfo.model;
      print('iOS $systemName $version, $name $model');
    }

    config.deviceVersion = version;
    config.deviceModel = deviceModel;
    config.deviceOS = os;
  }

  int get osCode {
    if (Platform.isAndroid) {
      return PlatformType.android.code;
    } else if (Platform.isIOS) {
      return PlatformType.ios.code;
    } else {
      return PlatformType.none.code;
    }
  }

  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
}

enum PlatformType { none, web, ios, android }

extension PlatformExtension on PlatformType {
  int get code {
    switch (this) {
      case PlatformType.web:
        return 1;
      case PlatformType.ios:
        return 2;
      case PlatformType.android:
        return 3;
      default:
        return 0;
    }
  }
}
