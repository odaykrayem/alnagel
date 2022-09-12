import 'dart:io';
import 'package:alnagel/models/TempUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alnagel/chatting_app/features/auth/repository/auth_repository.dart';
import 'package:alnagel/chatting_app/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  debugPrint('authCon');
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  });

  Future<UserModel?> getUserData() async {
    debugPrint('autncon');
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void signInWithPhone(
      BuildContext context, String phoneNumber, String tempUserInfo) {
    authRepository.signInWithPhone(context, phoneNumber, tempUserInfo);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP,
      String tempUserInfo) {
    authRepository.verifyOTP(
        context: context,
        verificationId: verificationId,
        userOTP: userOTP,
        tempUserInfo: tempUserInfo);
  }

  void saveUserDataToFirebase(BuildContext context, String name) {
    authRepository.saveUserDataToFirebase(
      name: name,
      // ref: ref,
      context: context,
      // profilePic: profilePic,
    );
  }

  Stream<UserModel> userDataById(String userId) {
    return authRepository.userData(userId);
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }
}
