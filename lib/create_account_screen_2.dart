// ignore_for_file: file_names
import 'dart:convert';

import 'package:alnagel/chatting_app/common/utils/utils.dart';
import 'package:alnagel/chatting_app/features/auth/controller/auth_controller.dart';
import 'package:alnagel/models/TempUser.dart';
import 'package:alnagel/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'login.dart';

class CreateAccountScreen2 extends ConsumerStatefulWidget {
  const CreateAccountScreen2({Key? key}) : super(key: key);
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen2> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

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
                    const SizedBox(
                      height: 100,
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
                                  left: 25.0, right: 26, top: 15, bottom: 15),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 100,
                                      alignment: Alignment.center,
                                      child:
                                          Image.asset('assets/images/n.png')),
                                  Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'CreateAnAccount'.tr,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                      )),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        login()));
                                          },
                                          child: Text(
                                            'Login'.tr,
                                            style: const TextStyle(
                                                color: Colors.teal),
                                          )),
                                      Text('AlreadyHaveAnAccount'.tr),
                                    ],
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _name,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'fullName'.tr,
                                          suffixIcon: const Icon(Icons.person),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'mail'.tr,
                                          suffixIcon: const Icon(Icons.email),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _mobileController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'MobileNumber'.tr,
                                          suffixIcon: Image.asset(
                                            'assets/images/Saudi-Arabia.png',
                                          ),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'password'.tr,
                                          suffixIcon:
                                              const Icon(Icons.remove_red_eye),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      TempUser tempUser = TempUser(
                                          name: _name.text,
                                          email: _emailController.text,
                                          phone: _mobileController.text,
                                          password: _passwordController.text);
                                      sendPhoneNumber(tempUser);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => otp(
                                      //             nameController: _name.text,
                                      //             emailController:
                                      //                 _emailController.text,
                                      //             phoneController:
                                      //                 _mobileController.text,
                                      //             passwordController:
                                      //                 _passwordController
                                      //                     .text)));
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
                                        'CreateAnAccount'.tr,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                      child: Text(
                                    'orRegisterWith'.tr,
                                    style: const TextStyle(fontSize: 15),
                                  )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: const FaIcon(
                                            FontAwesomeIcons.google,
                                            color: Colors.orange,
                                            size: 15,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: const FaIcon(
                                            FontAwesomeIcons.facebookF,
                                            size: 22,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Card(
                                        child: IconButton(
                                          icon: const FaIcon(
                                            FontAwesomeIcons.apple,
                                            size: 22,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                )));
  }

  void sendPhoneNumber(TempUser tempUser) {
    String phoneNumber = _mobileController.text.trim();
    if (phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, phoneNumber, jsonEncode(tempUser));
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  void storeUserData() async {
    String name = _name.text;

    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
          );
    }
  }
}
