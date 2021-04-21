

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_getx/api/api_account.dart';
import 'package:test_getx/api/base/api_response.dart';
import 'package:test_getx/api/param/param_oauth.dart';
import 'package:test_getx/api/response/response_oauth.dart';
import 'package:test_getx/controller/oauth/config_controller.dart';
import 'package:test_getx/controller/oauth/sso/sso_controller.dart';
import 'package:test_getx/util/device_utils.dart';
import 'db/database_controller.dart';

final String _TAG = 'OauthProvider';

class LoginController extends GetxController {

  AccountApi _api = AccountApi();

  RxString _userIdToken = ''.obs;

  RxString get userIdToken => _userIdToken;

  RxBool _loadingState = false.obs;

  RxBool get loadingState => _loadingState;

  RxBool _hasError = false.obs;

  RxBool get hasError => _hasError;

  set hasError(RxBool error) => _hasError = error;

  get dbModel => null;

  Future<void> oauth(DatabaseController dbController) async {
    ConfigController config = Get.find();
    var _ssoController = Get.find<SSOController>();

    _loadingState(true);
    var user = await _ssoController.googleSignIn();

    //william: fcm 토큰 저장되어있는지 정확한 확인 안됨.
    var dUtil = DeviceUtils.instance();
    var param = ParamOAuth.fromToken(
        idToken: userIdToken.value,
        os: dUtil.os,
        model: dUtil.deviceModel,
        version: dUtil.version,
        token: config.deviceToken,
        dateOfBirth: "19900219",
        level: 1,
        gender: "female",
        manageCode: "JVVPFRQDEZ2",
        companyName: "AIA생명",
        companyCode: "L52");

    // var response = await _api.oauth(param);
    // log("@!!response: ${response.statusCode}");
    // var apiResponse = ApiBase.fromJson(jsonDecode(response.body));
    // log("@!!response.body: ${response.body}");
    // if (response.statusCode != 200) {
    //   if (!apiResponse.isSucceed) {
    //     _loadingState(false);
    //     _hasError(true);
    //   }
    //   return;
    // }

    // if (!apiResponse.isSucceed) {
      // if (apiResponse.error.code == 509) {
      //   log('$_TAG::oauth Error ==> 509 Error');
      //   _hasError(true);
      // } else if (apiResponse.error.code == 560) {
      //   _hasError(true);
      // }
      // return;
    // }

    // var oauthResponse = ResponseOauth.fromJson(apiResponse.data);
    // if (oauthResponse == null) {
    //   return;
    // }

    _userIdToken(await user.getIdToken());
    _loadingState(false);
  }

  Future<void> signout(SSOController ssoController, ConfigController configController) async {
    _loadingState(true);
    await ssoController.googleSignOut();

    await FirebaseAuth.instance.signOut();

    _userIdToken('');
    _loadingState(false);
  }

  @override
  void onInit() {
    // ever(_userIdToken, (_) {
    //   log("@!!changed");
    // });
    // ever(_loadingState, (_) {
    //   log("@!!_loadingState");
    // });
    // ever(_hasError, (_) {
    //   log("@!!_hasError");
    // });
    super.onInit();
  }
}