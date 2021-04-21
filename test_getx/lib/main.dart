import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_getx/controller/oauth/db/database_controller.dart';
import 'package:test_getx/controller/oauth/login_controller.dart';
import 'package:test_getx/controller/oauth/sso/sso_controller.dart';
import 'package:test_getx/util/device_utils.dart';
import 'package:test_getx/util/firebase_initializer.dart';
import 'package:test_getx/view/main_page.dart';
import 'package:test_getx/view/widget/confirm_widget.dart';
import 'package:test_getx/view/widget/progress_bar_indicator.dart';

import 'controller/oauth/config_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var configController = Get.put(ConfigController(prefs));

  var firebaseInitializer = FirebaseInitializer();
  await firebaseInitializer.initialize();

  Get.put<LoginController>(LoginController());
  Get.put<SSOController>(SSOController());

  DeviceUtils.instance().init(configController);

  var databaseProvider =
      Get.put<DatabaseController>(DatabaseController.create());
  await databaseProvider.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  LoginController loginController = Get.find();
  DatabaseController dbController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await loginController.oauth(dbController);

                      if (loginController.userIdToken.isNotEmpty) {
                        Get.off(MainPage());
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
                Obx(
                  () =>
                      ProgressBarIndicator(loginController.loadingState.isTrue),
                ),
                Obx(
                  () => ConfirmWidget(
                      onButtonPressed: () => loginController.hasError(false),
                      title: "에러가 있어요.",
                      buttonText: "확인",
                      visible: loginController.hasError.isTrue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
