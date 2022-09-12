// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alnagel/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alnagel/data/repoistory/app_repo.dart';

class AppController extends GetxController {
  final AppRepo appRepo;
  AppController({
    required this.appRepo,
  });

  void saveApiToken(String apiToken) {
    appRepo.saveApiToken(apiToken);
  }

  String? getApiToken() {
    return appRepo.getApiToken();
  }

  void savelanguageCode(String langCode) {
    appRepo.saveLanguageCode(langCode);
  }

  String? getLanguageCode() {
    return appRepo.getLanguageCode();
  }

  void saveUserType(String userType) {
    appRepo.saveUserType(userType);
  }

  String? getUserType() {
    return appRepo.getUserType();
  }

  void saveUserInfo(User user) {
    // debugPrint('app con :' + user.toString());
    appRepo.saveUserInfo(jsonEncode(user));
  }

  User? getUserInfo() {
    return appRepo.getUserInfo();
  }

  void removeStorageData() {
    appRepo.removeStorageData();
  }
}
