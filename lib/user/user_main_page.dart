import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/user_banners_controller.dart';
import 'package:alnagel/controllers/user_offers_controller.dart';
import 'package:alnagel/user/user_home_page.dart';
import 'package:alnagel/user/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'myorder.dart';
import 'user_notifications_screen.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({Key? key}) : super(key: key);

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  List screen = [
    UserSettings(),
    UserNotificationsScreen(),
    UserOrders(),
    UserHomePage(),
  ];

  var _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    debugPrint('apitoken ${Get.find<AppController>().getApiToken()}');
    Get.put(UserOffersController(userOffersRepo: Get.find()), permanent: true);
    // Get.put(UserBannerController(userBannersRepo: Get.find()), permanent: true);

    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Historical

          /// Religious

          /// Natural
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: Text("Settings".tr),
            selectedColor: Colors.green,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.notifications_none),
            title: Text("notifications".tr),
            selectedColor: Colors.green,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: Text("requests".tr),
            selectedColor: Colors.green,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: Text("Main".tr),
            selectedColor: Colors.green,
          ),
        ],
      ),
      body: screen[_currentIndex],
    );
  }
}
