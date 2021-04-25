import 'dart:async';
import 'dart:developer';

import 'package:doctoron/provider/config/config_provider.dart';
import 'package:doctoron/provider/oauth/oauth_provider.dart';
import 'package:doctoron/provider/oauth/sso/sso_provider.dart';
import 'package:doctoron/repositories/PixieMessaging.dart';
import 'package:doctoron/util/device_utils.dart';
import 'package:doctoron/util/firebase_initializer.dart';
import 'package:doctoron/view/login_page.dart';
import 'package:doctoron/view/main_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Config
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var configProvider = ConfigProvider(prefs);

  //FIREBASE
  var firebaseInitializer = FirebaseInitializer();
  await firebaseInitializer.initialize(configProvider);
  _initFirebaseMessaging(configProvider);

  //AppPackageInfo
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  configProvider.appVersion = packageInfo.version;

  //Device Util
  DeviceUtils.instance().init(configProvider);

  final List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(
      create: (context) => configProvider,
      lazy: false,
    ),
    Provider<SSOProvider>(
      create: (_) => SSOProvider(),
    ),
    ChangeNotifierProvider<OauthProvider>(
      create: (_) => OauthProvider(),
    ),
  ];

  runZonedGuarded(() {
    runApp(
      MultiProvider(
        providers: providerList,
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: Consumer<ConfigProvider>(
        builder: (context, configModel, child) =>
            configModel.userJoined ? MainPage() : LoginPage(),
        child: LoginPage(),
      ),
    );
  }
}

Future<void> _initFirebaseMessaging(ConfigProvider configModel) async {
  if (configModel.fcmToken.isNotEmpty) {
    //TODO: 앱 삭제시 프리퍼런스 삭제되는지 확인.
    log('#### already registered');
    return;
  }

  var token = await PixieMessaging().registerToken();
  if (token.isNotEmpty) {
    configModel.fcmToken = token;
  }
}
