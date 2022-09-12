import 'package:alnagel/componant.dart';
import 'package:alnagel/user/user_home_page.dart';
import 'package:alnagel/user/myorder.dart';
import 'package:alnagel/user/user_notifications_screen.dart';
import 'package:alnagel/user/user_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../messages.dart';
import 'states.dart';

class cubitapi extends Cubit<statesapi> {
  cubitapi() : super(initialstate());

  static cubitapi get(context) => BlocProvider.of(context);
  int currentindex = 0;
  var u = TextEditingController();
  String hexString = "00afa0";
  // dynamic context;
  // List<Widget> screens = [
  //   setting(),
  //   notifications(),
  //   myorder(),
  //   homepagescreen(),
  // ];
  List<BottomNavigationBarItem> bottomitem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings'.tr,
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_none,
        ),
        label: 'notifications'.tr),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart_outlined,
        ),
        label: ' requests'.tr),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Main'.tr),
  ];
  void onchange(int index) {
    currentindex = index;
    if (index == 0) getnotifi();
    if (index == 1) getmessages();
    if (index == 2) getplus();
    if (index == 3) getworknow();
    emit(botomnavbarchangelstate());
  }

  void getnotifi() {
    emit(notification());
  }

  void getmessages() {
    emit(messages());
  }

  void getplus() {
    emit(plus());
  }

  void getworknow() {
    emit(worknow());
  }

  List<Messages> m = [
    Messages(
      text: 'yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      issent: true,
    ),
    Messages(
      text: 'yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      issent: false,
    ),
  ].reversed.toList();
  var b = TextEditingController();
}
