import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doctoron/api/AccountApi.dart';
import 'package:doctoron/api/base/api_response.dart';
import 'package:doctoron/api/param/auth/param_oauth.dart';
import 'package:doctoron/api/response/response_oauth.dart';
import 'package:doctoron/provider/config/config_provider.dart';
import 'package:doctoron/provider/oauth/sso/sso_provider.dart';
import 'package:doctoron/util/device_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

final String _TAG = 'OauthProvider';

class OauthProvider with ChangeNotifier {
  AccountApi _api = AccountApi();

  AuthState _state = AuthState.init;

  AuthState get state => _state;

  void setState(AuthState value) {
    _state = value;
    notifyListeners();
  }

  Gender _gender = Gender.male;

  Gender get gender => _gender ?? Gender.male;

  void setGender(Gender gender) {
    _gender = gender;
    notifyListeners();
  }

  Future<void> oauth(SSOProvider ssoModel, ConfigProvider configModel) async {
    _state = AuthState.progress;
    notifyListeners();

    var idToken = await _googleAuth(ssoModel, configModel);

    log("@!!idToken: $idToken");

    if(idToken.isNotEmpty && idToken != null) {
      _state = AuthState.oauth_success;
      notifyListeners();
    }

    _callOauthApi(idToken, configModel);
    // _createDB();

    _state = AuthState.oauth_success;
    notifyListeners();
    log('$_TAG::oauth state ==> $_state');

    configModel.userJoined = true;
  }

  Future<void> signout(SSOProvider ssoModel,
      ConfigProvider configModel) async {
    _state = AuthState.progress;
    notifyListeners();

    _deleteDB();

    await _ssoSignout(ssoModel);

    await FirebaseAuth.instance.signOut();

    _state = AuthState.signout_success;

    configModel.logout = true;
    configModel.userJoined = false;

    notifyListeners();
  }

  Future<String> _googleAuth(
      SSOProvider model, ConfigProvider configModel) async {
    _state = AuthState.progress;
    notifyListeners();

    var user = await model.googleSignIn();

    if (user == null) {
      _state = AuthState.error_sso;
      configModel.clearConfig();
      notifyListeners();
      return Future.value(null);
    }

    _state = AuthState.signin_success;
    notifyListeners();

    return await user.getIdToken();
  }

  Future<void> _ssoSignout(SSOProvider model) async {
    // Platform.isIOS ? await model.appleSignOut() : await model.googleSignOut();
    await model.googleSignOut();
  }

  void _callOauthApi(String idToken, ConfigProvider configModel) async{
    var dUtil = DeviceUtils.instance();
    var param = ParamOAuth.fromToken(
        idToken: idToken,
        os: dUtil.os,
        model: dUtil.deviceModel,
        version: dUtil.version,
        token: configModel.deviceToken,
        identityNumber: "9002191234567",
        mobile: "01045384478",
        gender: "male");


    var response = await _api.oauth(param);
    log("@!!response: ${response}");
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
    log("@!!response.body: ${response.body}");
    if (response.statusCode != 200) {
      if (!apiResponse.isSucceed) {
        _state = AuthState.error_oauth;
        notifyListeners();
      }
      return;
    }

    if (!apiResponse.isSucceed) {
      if (apiResponse.error.code == 509) {
        log('$_TAG::oauth Error ==> 509 Error');
        _state = AuthState.error_over_joined;
        notifyListeners();
      } else if (apiResponse.error.code == 560) {
        log('$_TAG::oauth Error ==> 560 Error');
        _state = AuthState.error_myself;
        notifyListeners();
      }
      return;
    }

    var oauthResponse = ResponseOauth.fromJson(apiResponse.data);
    if (oauthResponse == null) {
      log('$_TAG::oauth Error ==> oauthResponse is null');
      _state = AuthState.error_oauth;
      notifyListeners();
      return;
    }
  }

  void _createDB() {
    // await dbModel.createTable<AuthDao>();
    // var dbResult = await dbModel
    //     .getDao<AuthDao>()
    //     .create(AuthEntity.fromResponse(oauthResponse));
    // if (dbResult == false) {
    //   _state = AuthState.error_db;
    //   notifyListeners();
    //   return;
    // }
  }

  void _deleteDB() {
    // var oauthInfo = await dbModel.getDao<AuthDao>().read();
    // if (oauthInfo == null) {
    //   _state = AuthState.error_db;
    //   notifyListeners();
    //   return;
    // }

    // var param = ParamUserToken(oauthInfo.userToken);
    // var response = await _api.signout(param);
    // log("@!!response.status: ${response.statusCode}");

    // await dbModel.getDao<AuthDao>().deleteAll();
  }
}

enum AuthState {
  init,
  progress,
  error_sso,
  error_oauth,
  error_certify,
  error_myself,
  error_over_joined,
  error_signout,
  error_db,
  oauth_success,
  signin_success,
  signout_success
}

enum Gender {
  male,
  female,
}