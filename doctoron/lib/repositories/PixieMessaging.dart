import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PixieMessaging {
  static final PixieMessaging _instance = PixieMessaging._internal();

  final _firebaseMessaging = FirebaseMessaging();

  factory PixieMessaging() {
    return _instance;
  }

  PixieMessaging._internal() {}

  void _requestIOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((event) {
      log('##PixieMessaging## onIosSettingsRegistered: $event');
    });
  }

  Future<String> registerToken() async {
    if (Platform.isIOS) {
      _requestIOSPermission();
    }

    String token = await _firebaseMessaging.getToken();
    log('##PixieMessaging## FCM Token: $token');

    return token;
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