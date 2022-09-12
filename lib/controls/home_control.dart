import 'dart:convert';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../componant.dart';
import '../models/banner_model.dart';
import '../models/my_requests.dart';
import '../models/place.dart';
import '../payment.dart';

class home_Control {
  Future add_order(
      context,
      String type,
      String cost,
      String notes,
      String from,
      String to,
      String at_time,
      String from_x,
      String from_y,
      String to_x,
      String to_y) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key);
    String userToken = Get.find<AppController>().getApiToken()!;
    String myUrl = "$serverUrl/add_order";
    http.Response response = await http.post(Uri.parse(myUrl), body: {
      'token': userToken,
      'type': type,
      'cost': cost,
      'notes': notes,
      'from': from,
      'to': to,
      'tax': '37.54654',
      'tax2': '37.65955',
      'at_time': at_time,
      'from_x': from_x,
      'from_y': from_y,
      'to_x': to_x,
      'to_y': to_y
    });

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialog(
        builder: (BuildContext context) => AlertDialog(
          content: Container(
            height: 200,
            child: Column(
              children: [
                Image.asset('assets/images/Group 8775.png'),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  'YourRequestHasBeenSentToDrivers'.tr,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        context: context,
      );

      try {} catch (error) {
        print(error);
      }
    } else {
      //print(response.statusCode);
      //  login_status = true
      throw "Error While getting profile";
    }
  }

  Future<List<MyRequest>?> getOrders() async {
    String myUrl = "$serverUrl/my_order";
    final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key);
    String userToken = Get.find<AppController>().getApiToken()!;
    // print(value);
    http.Response response =
        await http.post(Uri.parse(myUrl), body: {"token": userToken});
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      try {
        List<MyRequest> orders = body
            .map(
              (dynamic item) => MyRequest.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);
        return null;
      }
    } else {
      throw "Error While getting Properties";
    }
  }

  Future<List<MyRequest>?> getLatestOrder() async {
    String myUrl = "$serverUrl/get_latest_order";
    final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key);
    // print(value);
    String userToken = Get.find<AppController>().getApiToken()!;
    http.Response response =
        await http.post(Uri.parse(myUrl), body: {"token": userToken});
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      try {
        List<MyRequest> orders = body
            .map(
              (dynamic item) => MyRequest.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);
        return null;
      }
    } else {
      throw "Error While getting Properties";
    }
  }

  Future<List<BannerModel>?> getBanner() async {
    String myUrl = "$serverUrl/BannerModel";
    http.Response response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      try {
        List<BannerModel> orders = body
            .map(
              (dynamic item) => BannerModel.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);
        return null;
      }
    } else {
      throw "Error While getting Properties";
    }
  }
}
