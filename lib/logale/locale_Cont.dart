// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    Get.updateLocale(locale);
  }
}
