// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alnagel/chatting_app/common/utils/utils.dart';
import 'package:alnagel/models/TempUser.dart';
import 'package:alnagel/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alnagel/chatting_app/features/auth/controller/auth_controller.dart';
import 'controls/User_control.dart';

class OTPScreen extends ConsumerWidget {
  final String userInfo;
  final String verificationId;

  OTPScreen({
    Key? key,
    required this.userInfo,
    required this.verificationId,
  }) : super(key: key);

  User_Control user_control = User_Control();
  late TempUser tempUser;

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP, userInfo);
  }

  // FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";

  TextEditingController OTPScreenController = TextEditingController();
  String? userOTP;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tempUser = TempUser.fromJson(jsonDecode(userInfo));
    return Scaffold(
      body: DecoratedBox(
          decoration: const BoxDecoration(),
          child: Container(
            color: Colors.teal,
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 70),
              child: SingleChildScrollView(
                child: Column(children: [
                  Image.asset('assets/images/n.png', height: 100),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'VerifyPhoneNumber'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'vip_bold'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                          text: "EnterTheCodeSentTo".tr,
                          children: [
                            TextSpan(
                                text: tempUser.phone,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'vip_bold')),
                          ],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'vip_bold')),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),

                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 6) {
                              return " ";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            disabledColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                          controller: OTPScreenController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("مكتمل");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            userOTP = value;
                          },
                          beforeTextPaste: (text) {
                            debugPrint(" السماح باللصق  $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (userOTP != null) {
                        debugPrint('${userOTP!.length}');
                        if (userOTP!.length == 6) {
                          debugPrint('verOTP1');
                          verifyOTP(ref, context, userOTP!.trim());
                        }
                      } else {
                        showSnackBar(
                            context: context, content: 'Plese enter the code');
                      }
                      // registerFunction(context);
                    },
                    child: Text(
                      ('CreateAnAccount'.tr),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'vip_bold'),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minimumSize: const Size(200, 60),
                        primary: Colors.teal),
                  )
                ]),
              ),
            ),
          )),
    );
  }

  // void loginWithPhone() async {
  //   debugPrint('phone ' + phone.toString());
  //   auth.verifyPhoneNumber(
  //     phoneNumber: phone.toString(),
  //     // phoneNumber: '+963${widget.phone.text}',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential).then((value) {
  //         //  print("You are logged in successfully");
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       debugPrint(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       verificationID = verificationId;
  //       //  print("successfully");
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // void verifyOTPScreen() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationID, smsCode: OTPScreenController.text);

  //   await auth.signInWithCredential(credential).then((value) {
  //     registerFunction(context);
  //   });
  // }

  // registerFunction(var context) async {
  //   String? userType = Get.find<AppController>().getUserType();
  //   if (password.isNotEmpty && phone.isNotEmpty) {
  //     await user_control
  //         .register(
  //       name.trim(),
  //       email.trim(),
  //       password.trim(),
  //       phone.trim(),
  //     )
  //         .whenComplete(() {
  //       if (user_control.status) {
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
  //           return userType == AppConstants.USER_TYPE_USER
  //               ? const UserMainPage()
  //               : const TransporterMainPage();
  //         }));
  //       }
  //     });
  //   } else {
  //     debugPrint('some filed is empty');
  //     // _showDialog(
  //     //     "هناك بعض القيم المدخلة فارعة الرجاء التأكد من إدخال جميع القيم");
  //   }
  // }

}
