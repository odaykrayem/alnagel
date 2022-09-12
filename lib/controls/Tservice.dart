import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../componant.dart';
import '../models/mtruck.dart';

class truck_Control {
  Future add_service(String type, context, String detail) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = prefs.get(key);

    String myUrl = "$serverUrl/add_service";

    http.Response response = await http.post(Uri.parse(myUrl),
        body: {'token': value, 'type': '$type', 'detail': detail});

    print(response.body);

    if (response.statusCode == 200) {
      try {} catch (error) {
        print(error);
      }
    } else if (response.statusCode == 404) {
    } else {
      //  login_status = true
      throw "Error While getting profile";
    }
  }

  Future<List<Truck>?> getservice() async {
    String myUrl = "$serverUrl/get_wait_order";
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = prefs.get(key);
    print(value);
    http.Response response =
        await http.post(Uri.parse(myUrl), body: {"token": value});
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      try {
        List<Truck> orders = body
            .map(
              (dynamic item) => Truck.fromJson(item),
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
