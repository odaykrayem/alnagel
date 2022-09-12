// import 'package:alnagel/chatting_app/common/repositories/common_firebase_storage_repository.dart';
// import 'dart:io';

import 'dart:convert';

import 'package:alnagel/Transporter/transporter_main.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controls/User_control.dart';
import 'package:alnagel/models/TempUser.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/user/user_main_page.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alnagel/chatting_app/common/utils/utils.dart';
import 'package:alnagel/chatting_app/models/user_model.dart';
import 'package:get/get.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    String userUID;
    if (auth.currentUser == null) {
      userUID = Get.find<AppController>().getUserInfo()!.uuid;
    } else {
      userUID = auth.currentUser!.uid;
    }

    debugPrint('UID' + userUID);

    var userData = await firestore.collection('users').doc(userUID).get();
    // await firestore.collection('users').doc(uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithPhone(
      BuildContext context, String phoneNumber, String tempUserInfo) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          // Navigator.pushNamed(
          //   context,
          //   OTPScreen.routeName,
          //   arguments: verificationId,
          // );
          Get.toNamed(RouteHelper.getOTPScreen(verificationId, tempUserInfo));
        }),
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message ?? '');
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
    required String tempUserInfo,
  }) async {
    debugPrint('verOTP2');

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential).whenComplete(() {
        registerFunction(context, tempUserInfo);
      });
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   UserInformationScreen.routeName,
      //   (route) => false,
      // );

    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message ?? '');
    }
  }

  void saveUserDataToFirebase({
    required String name,
    // required File? profilePic,
    // required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String id = '${Get.find<AppController>().getUserInfo()!.id}';

      // String photoUrl =
      //     'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      // if (profilePic != null) {
      //   photoUrl = await ref
      //       .read(commonFirebaseStorageRepositoryProvider)
      //       .storeFileToFirebase(
      //         'profilePic/$uid',
      //         profilePic,
      //       );
      // }

      var user = UserModel(
        name: name,
        uid: uid,
        id: id,
        isOnline: true,
        phoneNumber: auth.currentUser!.phoneNumber!,
        // profilePic: photoUrl,
        // groupId: [],
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const MobileLayoutScreen(),
      //   ),
      //   (route) => false,
      // );
      showSnackBar(context: context, content: 'user saved to firebase');
    } catch (e) {
      showSnackBar(context: context, content: '$e');
    }
  }

  Stream<UserModel> userData(String userId) {
    return firestore.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    String userUID;
    if (auth.currentUser == null) {
      userUID = Get.find<AppController>().getUserInfo()!.uuid;
    } else {
      userUID = auth.currentUser!.uid;
    }
    await firestore.collection('users').doc(userUID).update({
      'isOnline': isOnline,
    });
  }

  registerFunction(var context, String userInfo) async {
    String? userType = Get.find<AppController>().getUserType();
    User_Control user_control = User_Control();
    TempUser tempUser = TempUser.fromJson(jsonDecode(userInfo));
    await user_control
        .register(tempUser.name, tempUser.email, tempUser.password,
            tempUser.phone, auth.currentUser!.uid)
        .whenComplete(() {
      debugPrint('verOTP33register');

      if (user_control.status) {
        debugPrint('verOTP33registersuccess');
        saveUserDataToFirebase(name: tempUser.name, context: context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return userType == AppConstants.USER_TYPE_USER
              ? const UserMainPage()
              : const TransporterMainPage();
        }));
      }
    });
  }
}
