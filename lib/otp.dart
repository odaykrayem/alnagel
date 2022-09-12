import 'package:alnagel/Transporter/transporter_main.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controls/User_control.dart';
import 'user/user_main_page.dart';

class otp extends StatefulWidget {
  String nameController;
  String emailController;
  String phoneController;
  String passwordController;
  otp(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController})
      : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  User_Control user_control = User_Control();

  @override
  void initState() {
    loginWithPhone();
    super.initState();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                text: "${widget.phoneController}",
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
                            if (v!.length < 3) {
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
                          controller: otpController,
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
                            setState(() {
                              // currentText = value;
                            });
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
                      verifyOTP();
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

  void loginWithPhone() async {
    debugPrint('phone ' + widget.phoneController.toString());
    auth.verifyPhoneNumber(
      phoneNumber: '${widget.phoneController.toString()}',
      // phoneNumber: '+963${widget.phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          //  print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        setState(() {});
        //  print("successfully");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      registerFunction(context);
    });
  }

  registerFunction(var context) async {
    var pref = await SharedPreferences.getInstance();

    // if (widget.passwordController.isNotEmpty &&
    //     widget.phoneController.isNotEmpty) {
    //   await user_control
    //       .register(
    //     widget.nameController.trim(),
    //     widget.emailController.trim(),
    //     widget.passwordController.trim(),
    //     widget.phoneController.trim(),
    //   )
    //       .whenComplete(() {
    //     if (user_control.status) {
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
    //         return pref.getString(AppConstants.USER_TYPE_KEY) ==
    //                 AppConstants.USER_TYPE_USER
    //             ? UserMainPage()
    //             : TransporterMainPage();
    //       }));
    //     }
    //   });
    // } else {
    //   print('some filed is empty');
    //   _showDialog(
    //       "هناك بعض القيم المدخلة فارعة الرجاء التأكد من إدخال جميع القيم");
    // }
  }

  void _showDialog(content) {}
}
