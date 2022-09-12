// ignore_for_file: file_names

import 'package:alnagel/create_account_screen.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinAsScreen extends StatefulWidget {
  const JoinAsScreen({Key? key}) : super(key: key);

  @override
  _JoinAsScreenState createState() => _JoinAsScreenState();
}

class _JoinAsScreenState extends State<JoinAsScreen> {
  String hexString = "00afa0";
  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        left: 76,
        right: 20,
        top: 40,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'joinAs'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse("0xff$hexString")),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 200,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    appController.saveUserType(AppConstants.USER_TYPE_USER);
                    Get.toNamed(RouteHelper.getCreateAccountScreen());
                    // _save(AppConstants.USER_TYPE_USER);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const makeacount()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assets/images/Group 8773.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Client'.tr,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: OutlinedButton(
                  onPressed: () {
                    appController
                        .saveUserType(AppConstants.USER_TYPE_TRANSPORTER);
                    Get.toNamed(RouteHelper.getCreateAccountScreen());

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const makeacount()));
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Image.asset('assets/images/Group.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Transporter'.tr,
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(int.parse("0xff$hexString")),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }

  // _save(String type) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(AppConstants.USER_TYPE_KEY, type);
  //   debugPrint('prefs-user : ${prefs.getString(AppConstants.USER_TYPE_KEY)}');
  // }
}
