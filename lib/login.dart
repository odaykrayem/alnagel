import 'package:alnagel/Transporter/transporter_main.dart';
import 'package:alnagel/controls/User_control.dart';
import 'package:alnagel/forgetmymobile.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user/user_main_page.dart';

class login extends StatefulWidget {
  @override
  login2 createState() => login2();
}

class login2 extends State<login> {
  User_Control user_control = User_Control();
  void _showDialog(content) {}

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  loginfunction(var context) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get(AppConstants.USER_TYPE_KEY);

    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      await user_control
          .login(_emailController.text.trim(), _passwordController.text.trim(),
              context)
          .whenComplete(() {
        if (user_control.status) {
          if (value == AppConstants.USER_TYPE_USER) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return UserMainPage();
            }));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return TransporterMainPage();
            }));
          }
        }
      });
    } else {
      print('some filed is empty');
      _showDialog(
          "SomeValuesEnteredAreEmptyPleaseMakeSureThatAllValuesAreEntered".tr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(backgroundColor:Colors.teal ,
        // ),
        body:
            // SingleChildScrollView(child:
            Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.teal,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Container(
                          width: 330,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 26, top: 15, bottom: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),

                                  Container(
                                      height: 100,
                                      alignment: Alignment.center,
                                      child:
                                          Image.asset('assets/images/n.png')),

                                  Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'Entry'.tr,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                      )),
                                  //SizedBox(height: 2,),

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 90,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'CreateAnAccount'.tr,
                                            style:
                                                TextStyle(color: Colors.teal),
                                          )),
                                      Text(
                                        'DontHaveAnAccount'.tr,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _emailController,
                                        //controller: coo.u ,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'mail'.tr,
                                          suffixIcon: Icon(Icons.email),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'empty';
                                          }

                                          return null;
                                        }),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _passwordController,
                                        // controller: coo.u ,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'password'.tr,
                                          suffixIcon: Icon(
                                              Icons.remove_red_eye_outlined),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'empty';
                                          }

                                          return null;
                                        }),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        forgetmymobile()));
                                          },
                                          child: Text(
                                            'IForgotTheSecretNumber'.tr,
                                            style:
                                                TextStyle(color: Colors.teal),
                                          ))),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      loginfunction(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black54,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 280,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Entry'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: 30,),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Center(
                                        child: Text(
                                      'orLoginWith'.tr,
                                      style: TextStyle(fontSize: 15),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.google,
                                            color: Colors.orange,
                                            size: 15,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.facebookF,
                                            size: 22,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.apple,
                                            size: 22,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ]),
                )));
  }
}
