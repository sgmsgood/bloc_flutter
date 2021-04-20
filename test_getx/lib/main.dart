import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_getx/controller/oauth/login_controller.dart';
import 'package:test_getx/controller/oauth/sso/sso_controller.dart';
import 'package:test_getx/util/firebase_initializer.dart';
import 'package:test_getx/view/main_page.dart';

import 'controller/oauth/config_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  var firebaseInitializer = FirebaseInitializer();
  await firebaseInitializer.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  Get.put<LoginController>(LoginController());
  Get.put<SSOController>(SSOController());
  Get.put(ConfigController(prefs));

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
      home: GetBuilder<LoginController>(
        builder: (controller) => MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends GetView<LoginController> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                await loginController.googleAuth();
                once(controller.userIdToken, (_) {
                  log("@!!loginController.userIdToken: ${controller.userIdToken}");
                  if (controller.userIdToken != '') {
                    Get.off(MainPage());
                  }
                });
              },
              child: Text("Login"),
            ),
          ),
        ),
      ),
    );
  }
}
