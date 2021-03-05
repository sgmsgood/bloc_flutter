import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel with ChangeNotifier {
  var _isLogin = false;

  bool isLogin() {
    return _isLogin;
  }

  void setLoginState(bool state) async{
    var pref = await SharedPreferences.getInstance();
    _isLogin = state;
    pref.setBool('login', _isLogin);
    notifyListeners();
  }

  Future<bool> loadLoginState() async{
    var pref = await SharedPreferences.getInstance();
    _isLogin = pref.getBool('login');
    return _isLogin;
  }
}

class ImageModel with ChangeNotifier {
  var _isShow = true;

  bool isShow() {
    return _isShow;
  }

  void setImageShow(bool show) async{
    _isShow = show;
    notifyListeners();
  }
}