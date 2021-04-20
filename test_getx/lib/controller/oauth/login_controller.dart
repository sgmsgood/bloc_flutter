
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_getx/api/api_account.dart';
import 'package:test_getx/api/base/api_response.dart';
import 'package:test_getx/api/param/param_oauth.dart';
import 'package:test_getx/api/response/response_oauth.dart';
import 'package:test_getx/controller/oauth/config_controller.dart';
import 'package:test_getx/controller/oauth/sso/sso_controller.dart';
import 'package:test_getx/util/device_utils.dart';

final String _TAG = 'OauthProvider';

class LoginController extends GetxController {
  SSOController _ssoController = Get.put(SSOController());
  ConfigController _configController = Get.find<ConfigController>();

  AccountApi _api = AccountApi();

  var _userIdToken = ''.obs;

  get userIdToken => _userIdToken;

  Future<void> googleAuth() async {
    var user = await _ssoController.googleSignIn();
    _userIdToken.value = await user.getIdToken();

    //william: fcm 토큰 저장되어있는지 정확한 확인 안됨.
    var dUtil = DeviceUtils.instance();
    var param = ParamOAuth.fromToken(
        idToken: _configController.idToken,
        os: dUtil.os,
        model: dUtil.deviceModel,
        version: dUtil.version,
        token: _configController.deviceToken,
        dateOfBirth: "19900219",
        level: 1,
        gender: "female",
        manageCode: _configController.manageCode,
        companyName: _configController.companyName,
        companyCode: _configController.companyCode);

    var response = await _api.oauth(param);
    log("@!!response: ${response.statusCode}");
    var apiResponse = ApiBase.fromJson(jsonDecode(response.body));
    log("@!!response.body: ${response.body}");
    if (response.statusCode != 200) {
      if (!apiResponse.isSucceed) {
        // _state = AuthState.error_oauth;
        // notifyListeners();
      }
      return;
    }

    if (!apiResponse.isSucceed) {
      if (apiResponse.error.code == 509) {
        log('$_TAG::oauth Error ==> 509 Error');
        _configController.clearCertifyInfo();
        // _state = AuthState.error_over_joined;
        // notifyListeners();
      } else if (apiResponse.error.code == 560) {
        log('$_TAG::oauth Error ==> 560 Error');
        // _state = AuthState.error_myself;
        // notifyListeners();
      }
      return;
    }

    var oauthResponse = ResponseOauth.fromJson(apiResponse.data);
    if (oauthResponse == null) {
      // _state = AuthState.error_oauth;
      // notifyListeners();
      return;
    }

    // await dbModel.createTable<AuthDao>();
    // var dbResult = await dbModel
    //     .getDao<AuthDao>()
    //     .create(AuthEntity.fromResponse(oauthResponse));
    // if (dbResult == false) {
    //   _state = AuthState.error_db;
    //   notifyListeners();
    //   return;
    // }

    _configController.userJoined = true;
  }
}