import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FcmMessageProvider {
  static final FcmMessageProvider _instance = FcmMessageProvider._internal();

  final _firebaseMessaging = FirebaseMessaging();

  factory FcmMessageProvider() {
    return _instance;
  }

  FcmMessageProvider._internal() {
    _listenFirebaseMessaging();
  }

  void _requestIOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.onIosSettingsRegistered.listen((event) {
      log('##PixieMessaging## onIosSettingsRegistered: $event');
    });
  }

  Future<String> getFCMToken() async {
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    return await _firebaseMessaging.getToken();
  }

  void _listenFirebaseMessaging() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        log('##PixieMessaging## onMessage (receive message when app foreground: $message)');
      },
      onResume: (Map<String, dynamic> message) async {
        log('##PixieMessaging## onResume (receive message when app background: $message)');
      },
      onLaunch: (Map<String, dynamic> message) async {
        log('##PixieMessaging## onLaunch (receive message when app terminated: $message)');
      },
    );
  }
}
