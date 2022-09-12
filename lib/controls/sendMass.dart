// ignore: file_names
import 'package:alnagel/componant.dart';
import 'package:alnagel/models/massage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Message_control {
  Future<massage?> sendmassage(String name, String msg, context) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    String myUrl = "$serverUrl/sendmessage";

    print(name);
    print(msg);
    print(value);

    http.Response response = await http.post(Uri.parse(myUrl),
        body: {'token': value, 'name': name, 'msg_body': msg});

    print(response.body);

    if (response.statusCode == 200) {
      try {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Done'.tr,
          desc: 'MessageSentSuccessfully'.tr,
          btnOkOnPress: () {},
        ).show();
      } catch (error) {
        print(error);
      }
    } else if (response.statusCode == 404) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'fail'.tr,
        desc: 'PleaseLoginAgain'.tr,
        btnOkOnPress: () {},
      ).show();
    } else {
      //  login_status = true
      throw "Error While getting profile";
    }
  }
}
