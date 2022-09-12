import 'package:alnagel/componant.dart';
import 'package:alnagel/conditions.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controls/User_control.dart';
import 'package:alnagel/main.dart';
import 'package:alnagel/models/User.dart';
import 'package:alnagel/problems.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/shareapp.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:alnagel/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../componant.dart';
import '../my money.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  // User_Control user_control = User_Control();
  User? user;

  // @override
  // void initState() {
  //   user_control.getprofile().then((value) => setState(() {
  //         user = value;
  //       }));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    user = Get.find<AppController>().getUserInfo();
    return BlocProvider(
        create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              cubitapi co = cubitapi.get(context);

              return Scaffold(
                  appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: Text(
                        'Settings'.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      )),
                  body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 6, left: 6),
                          child: Container(
                              child: Column(children: [
                            SizedBox(
                              height: 60,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      height: 15,
                                      width: 15,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit, size: 14))),
                                  Container(
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        radius: 40,
                                        child: Image.asset(
                                            'assets/images/Group 8773.png'),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Center(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user == null ? '' : user!.name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        size: 14,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => mymoney()));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('myBalance'.tr),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                          'assets/images/Group 8922.png'),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                conditions()));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('TermsAndConditions'.tr),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => problems()));
                                  },
                                  child: Row(
                                    // crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Text('ComplaintsAndSuggestions'.tr),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.message_outlined,
                                          color: Colors.grey),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => shareapp()));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('ShareTheApp'.tr),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.share, color: Colors.grey),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    showDialog(
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        content: Container(
                                            height: 250,
                                            child: Column(
                                              children: [
                                                Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon:
                                                            Icon(Icons.close))),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Container(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                        'assets/images/Group 8923.png')),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: OutlinedButton(
                                                            style: ButtonStyle(
                                                                side:
                                                                    MaterialStateProperty
                                                                        .all(
                                                              BorderSide(
                                                                width: 1,
                                                                color:
                                                                    Colors.teal,
                                                              ),
                                                            )),
                                                            onPressed: () {
                                                              Get.find<
                                                                      AppController>()
                                                                  .removeStorageData();
                                                              // Get.reset();
                                                              // Get.toNamed(
                                                              //   RouteHelper
                                                              //       .getSplashScreen(),
                                                              // );
                                                              Get.offAllNamed(
                                                                  RouteHelper
                                                                      .getSplashScreen());
                                                              // Navigator.pushReplacement(
                                                              //     context,
                                                              //     MaterialPageRoute(
                                                              //         builder:
                                                              //             ((context) =>
                                                              //                 ())));
                                                            },
                                                            child: Text(
                                                              'Exit'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .teal),
                                                            ))),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                            'Cancellation'.tr),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .teal),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                      ),
                                      context: context,
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('LogOut'.tr),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.logout, color: Colors.grey),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ])))));
            }));
  }
}
