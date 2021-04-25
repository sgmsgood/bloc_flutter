import 'dart:developer';

import 'package:doctoron/provider/config/config_provider.dart';
import 'package:doctoron/provider/messaging/fcm_message_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer {
  final _kShouldTestAsyncErrorOnInit = false;
  final _kTestingCrashlytics = false;
  final _kDebugMode = true;

  Future<void> initialize(ConfigProvider config) async {
    await Firebase.initializeApp();

    if (_kTestingCrashlytics) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!_kDebugMode);
    }

    Function originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      originalOnError(errorDetails);
    };

    if (_kShouldTestAsyncErrorOnInit) {
      await _testAsyncErrorOnInit();
    }

    var token = await FcmMessageProvider().getFCMToken();
    config.deviceToken = token;
  }

  Future<void> _testAsyncErrorOnInit() async {
   Future<void>.delayed(const Duration(seconds: 2), () {
      final List<int> list = <int>[];
      print(list[100]);
    });
  }
}
