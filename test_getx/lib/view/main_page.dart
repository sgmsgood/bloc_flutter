import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_getx/controller/oauth/config_controller.dart';
import 'package:test_getx/controller/oauth/login_controller.dart';
import 'package:get/get.dart';
import 'package:test_getx/controller/oauth/sso/sso_controller.dart';
import 'package:test_getx/main.dart';
import 'package:test_getx/view/widget/progress_bar_indicator.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    log("@!!MainPage.isTrue: ${loginController.loadingState.isTrue}");
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  _buildTextView(),
                  _buildLogoutButton(),
                ],
              ),
            ),
            Obx(
              () => ProgressBarIndicator(loginController.loadingState.isTrue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextView() {
    return Text('');
  }

  Widget _buildLogoutButton() {
    LoginController loginController = Get.find();
    SSOController ssoController = Get.find();
    ConfigController configController = Get.find();

    return ElevatedButton(
      onPressed: () async {
        await loginController.signout(ssoController, configController);
        if (loginController.userIdToken.isEmpty) {
          Get.off(MyHomePage());
        }
      },
      child: Text('로그아웃'),
    );
  }
}
