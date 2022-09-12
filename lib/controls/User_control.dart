// ignore_for_file: file_names

import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/models/User.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../componant.dart';

// ignore: camel_case_types
class User_Control {
  bool status = false;

  var token;

  login(var email, var password, var context) async {
    // final prefs = await SharedPreferences.getInstance();
    AppController appController = Get.find<AppController>();
    final userType = appController.getUserType();
    var myUrl = userType == AppConstants.USER_TYPE_USER
        ? Uri.parse("$serverUrl/login")
        : Uri.parse("$serverUrl/loginDriver");
    final response = await http.post(myUrl,
        body: {"email": email.toString(), "password": password.toString()});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      debugPrint('data : ${data["api_token"]}');
      debugPrint('data 2 : ${data.toString()}');

      appController.saveApiToken(data["api_token"]);
      User user = User.fromJson(data);
      Get.find<AppController>().saveUserInfo(User.fromJson(data));
      debugPrint(Get.find<AppController>().getUserInfo().toString());
      status = true;
    } else {
      if (response.statusCode == 404) {
        // showCustomDialog(context, data["body"], 'info');
        showToast(text: '${data["body"]}');
        status = false;
      }
    }
  }

  register(var name, var email, var password, var phone, String uuid) async {
    // final prefs = await SharedPreferences.getInstance();
    AppController appController = Get.find<AppController>();
    final userType = appController.getUserType();

    var myUrl = userType == AppConstants.USER_TYPE_USER
        ? Uri.parse("$serverUrl/register")
        : Uri.parse("$serverUrl/registerDriver");
    final response = await http.post(myUrl, body: {
      'name': name.toString(),
      'email': email.toString(),
      'mobile': phone.toString(),
      'password': password.toString(),
      'uuid': uuid
    });
    debugPrint('${response.statusCode}');
    var data = json.decode(response.body);
    if (data['api_token'] == null) {
      showToast(text: 'This email is already existed try another one');
      status = false;
    } else {
      appController.saveApiToken(data["api_token"]);
      Get.find<AppController>().saveUserInfo(User.fromJson(data));

      debugPrint('data : ${data["api_token"]}');

      status = true;
    }
  }

  Future<User?> getprofile() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    String myUrl = "$serverUrl/profile";
    http.Response response =
        await http.post(Uri.parse(myUrl), body: {'token': '$value'});

    print(response.body);

    if (response.statusCode == 200) {
      try {
        status = true;
        User user = User.fromJson(jsonDecode(response.body));
        return user;
      } catch (error) {
        print(error);
      }
    } else if (response.statusCode == 404) {
      status = false;
    } else {
      status = false;
      //  login_status = true;
      throw "Error While getting profile";
    }
  }

  edit(String name, String phone, String manger, String address, String xpos,
      String ypos) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var myUrl = Uri.parse("$serverUrl/updateprofile");
    final response = await http.post(myUrl, body: {
      "name": "$name",
      'type': 'resturant',
      'phone': phone,
      'manger': manger,
      'address': address,
      'x': xpos,
      'y': ypos,
      'token': value
    });
    print(response.body);
//    var data = json.decode(response.body);
    status = true;
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  void showCustomDialog(
    dynamic context,
    String title,
    String type,
  ) {
    // type="error|success|info
  }
}
