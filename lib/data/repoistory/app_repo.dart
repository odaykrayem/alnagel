import 'dart:convert';

import 'package:alnagel/models/User.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepo {
  final SharedPreferences sharedPreferences;

  AppRepo({
    required this.sharedPreferences,
  });

  void saveApiToken(String apiToken) {
    sharedPreferences.setString(AppConstants.API_TOKEN_KEY, apiToken);
  }

  String? getApiToken() {
    return sharedPreferences.getString(AppConstants.API_TOKEN_KEY);
  }

  void saveLanguageCode(String langCode) {
    sharedPreferences.setString(AppConstants.LANGUAGE_CODE_KEY, langCode);
  }

  String? getLanguageCode() {
    return sharedPreferences.getString(AppConstants.LANGUAGE_CODE_KEY);
  }

  void saveUserType(String userType) {
    sharedPreferences.setString(AppConstants.USER_TYPE_KEY, userType);
  }

  String? getUserType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE_KEY);
  }

  void saveUserInfo(String userInfo) {
    // debugPrint('apprepo: $userInfo');
    sharedPreferences.setString(AppConstants.USER_INFO_KEY, userInfo);
  }

  User? getUserInfo() {
    if (sharedPreferences.containsKey(AppConstants.USER_INFO_KEY)) {
      return User.fromJson(
          jsonDecode(sharedPreferences.getString(AppConstants.USER_INFO_KEY)!));
    }
    return null;
  }

  void removeStorageData() {
    sharedPreferences.clear();
  }
}
