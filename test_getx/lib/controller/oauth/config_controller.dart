import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigController extends GetxController {
  static const String packageName = 'com.opusone.flutter_aai_senior';

  static const String kUserJoined = '$packageName.userJoined';
  static const String kUserId = '$packageName.userId';
  static const String kIsFirst = '$packageName.isFirst';
  static const String kInputProfile = '$packageName.inputProfile';

  static const String kUserName = '$packageName.userName';
  static const String kUserEmail = '$packageName.userEmail';
  static const String kUserImage = '$packageName.userImage';

  static const String kUserAge = '$packageName.userAge';
  static const String kUserGender = '$packageName.userGender';
  static const String kUserBirthday = '$packageName.userBirthday';
  static const String kUserHeight = '$packageName.userHeight';
  static const String kUserWeight = '$packageName.userWeight';
  static const String kUserSmoking = '$packageName.userSmoking';
  static const String kUserDrinking = '$packageName.userDrinking';
  static const String kUserExercise = '$packageName.userExercise';

  static const String kTermsOfService = '$packageName.termsOfService';
  static const String kAgreement = '$packageName.agreement';
  static const String kDarkMode = '$packageName.darkMode';

  static const String kDeviceToken = '$packageName.deviceToken';
  static const String kDeviceVersion = '$packageName.deviceVersion';
  static const String kDeviceOS = '$packageName.deviceOS';
  static const String kDeviceModel = '$packageName.deviceModel';

  static const String kIsCertified = '$packageName.isCertified';
  static const String kManageCode = '$packageName.manageCode';
  static const String kCompanyName = '$packageName.companyName';
  static const String kCompanyCode = '$packageName.companyCode';
  static const String kAppVersion = '$packageName.appVersion';
  static const String kIdToken = '$packageName.idToken';
  static const String kGenderButton = '$packageName.genderButton';
  static const String kIdentifyButton = '$packageName.identifyButton';
  static const String kIsShowPutProfileAlert =
      '$packageName.isShowPutProfileAlert';

  final SharedPreferences prefs;

  ConfigController(this.prefs);

  String get initPage {
    return this.userJoined ? '/home' : '/login';
  }

  set logout(bool value) {
    this.userId = null;
    this.userName = null;
    this.userEmail = null;
    this.userImage = null;
    this.userJoined = false;
    this.termsOfService = false;
    this.agreement = false;

    clearProfile();
  }

  // for Account
  String get userId => prefs?.getString(kUserId) ?? null;

  set userId(String value) => prefs?.setString(kUserId, value);

  bool get userJoined => prefs?.getBool(kUserJoined) ?? false;

  set userJoined(bool value) {
    prefs?.setBool(kUserJoined, value);
  }

  bool get isFirst => prefs?.getBool(kIsFirst) ?? false;

  set isFirst(bool value) => prefs?.setBool(kIsFirst, value);

  bool get inputProfile => prefs?.getBool(kInputProfile) ?? false;

  set inputProfile(bool value) => prefs?.setBool(kInputProfile, value);

  String get userName => prefs?.getString(kUserName) ?? null;

  set userName(String value) => prefs?.setString(kUserName, value);

  String get userEmail => prefs?.getString(kUserEmail) ?? null;

  set userEmail(String value) => prefs?.setString(kUserEmail, value);

  String get userImage => prefs?.getString(kUserImage) ?? null;

  set userImage(String value) => prefs?.setString(kUserImage, value);

  String get manageCode => prefs?.getString(kManageCode) ?? '';

  set _manageCode(String value) => prefs?.setString(kManageCode, value);

  String get companyName => prefs?.getString(kCompanyName) ?? '';

  set _companyName(String value) => prefs?.setString(kCompanyName, value);

  String get companyCode => prefs?.getString(kCompanyCode) ?? '';

  set _companyCode(String value) => prefs?.setString(kCompanyCode, value);

  // for User Profile (내 건강정보)
  int get userAge => prefs?.getInt(kUserAge) ?? null;

  set userAge(int value) => prefs?.setInt(kUserAge, value);

  int get userGender => prefs?.getInt(kUserGender) ?? null;

  set userGender(int value) => prefs?.setInt(kUserGender, value);

  String get userBirthday => prefs?.getString(kUserBirthday) ?? null;

  set userBirthday(String value) => prefs?.setString(kUserBirthday, value);

  double get userHeight => prefs?.getDouble(kUserHeight) ?? 0.0;

  set userHeight(double value) => prefs?.setDouble(kUserHeight, value);

  double get userWeight => prefs?.getDouble(kUserWeight) ?? 0.0;

  set userWeight(double value) => prefs?.setDouble(kUserWeight, value);

  int get userSmoking => prefs?.getInt(kUserSmoking) ?? null;

  set userSmoking(int value) => prefs?.setInt(kUserSmoking, value);

  int get userDrinking => prefs?.getInt(kUserDrinking) ?? null;

  set userDrinking(int value) => prefs?.setInt(kUserDrinking, value);

  int get userExercise => prefs?.getInt(kUserExercise) ?? null;

  set userExercise(int value) => prefs?.setInt(kUserExercise, value);

  String get deviceToken => prefs?.getString(kDeviceToken) ?? null;

  set deviceToken(String value) => prefs?.setString(kDeviceToken, value);

  String get deviceVersion => prefs?.getString(kDeviceVersion) ?? null;

  set deviceVersion(String value) => prefs?.setString(kDeviceVersion, value);

  String get deviceOS => prefs?.getString(kDeviceOS) ?? null;

  set deviceOS(String value) => prefs?.setString(kDeviceOS, value);

  String get deviceModel => prefs?.getString(kDeviceModel) ?? null;

  set deviceModel(String value) => prefs?.setString(kDeviceModel, value);

  String get appVersion => prefs?.getString(kAppVersion) ?? null;

  set appVersion(String value) => prefs?.setString(kAppVersion, value);

  String get idToken => prefs?.getString(kIdToken) ?? null;

  set idToken(String value) => prefs?.setString(kIdToken, value);

  // void storeProfile(ProfileData profileData) {
  //   userAge = profileData?.age;
  //   userGender = profileData?.gender;
  //   userBirthday = profileData?.birthday;
  //   userHeight = profileData?.height;
  //   userWeight = profileData?.weight;
  //   userSmoking = profileData?.smoking;
  //   userDrinking = profileData?.drinking;
  //   userExercise = profileData?.exercise;
  //   inputProfile = true;
  //   notifyListeners();
  // }

  void clearProfile() {
    userAge = null;
    userGender = null;
    userBirthday = null;
    userHeight = null;
    userWeight = null;
    userSmoking = null;
    userDrinking = null;
    userExercise = null;
    inputProfile = false;
    idToken = null;
  }

  // bool equalsProfile(ProfileData profileData) {
  //   if (userAge == null ||
  //       userGender == null ||
  //       userBirthday == null ||
  //       userHeight == null ||
  //       userWeight == null ||
  //       userSmoking == null ||
  //       userDrinking == null ||
  //       userExercise == null) return false;
  //   if (userAge != profileData?.age ||
  //       userGender != profileData?.gender ||
  //       !userBirthday.equalsIgnoreCase(profileData?.birthday) ||
  //       userHeight != profileData?.height ||
  //       userWeight != profileData?.weight ||
  //       userSmoking != profileData?.smoking ||
  //       userDrinking != profileData?.drinking ||
  //       userExercise != profileData?.exercise) return false;
  //
  //   return true;
  // }

  // flag on application
  bool get termsOfService => prefs?.getBool(kTermsOfService) ?? false;

  set termsOfService(bool value) => prefs?.setBool(kTermsOfService, value);

  bool get agreement => prefs?.getBool(kAgreement) ?? false;

  set agreement(bool value) => prefs?.setBool(kAgreement, value);

  bool get darkMode => prefs?.getBool(kDarkMode) ?? false;

  set darkMode(bool value) {
    prefs?.setBool(kDarkMode, value);
  }

  void setCertifyInfo(String code, String companyName, String companyCode) {
    _manageCode = code;
    _companyName = companyName;
    _companyCode = companyCode;
  }

  void clearCertifyInfo() {
    _manageCode = '';
    _companyName = '';
    _companyCode = '';
  }

  bool isValidCertifyInfo() {
    return manageCode.isNotEmpty && companyName.isNotEmpty && companyName.isNotEmpty;
  }
}
