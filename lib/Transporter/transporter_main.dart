import 'package:alnagel/Transporter/Tnotifications.dart';
import 'package:alnagel/Transporter/transporter_home.dart';
import 'package:alnagel/Transporter/transporter_orders.dart';
import 'package:alnagel/Transporter/transporter_settings_screen.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TransporterMainPage extends StatefulWidget {
  const TransporterMainPage({Key? key}) : super(key: key);

  @override
  State<TransporterMainPage> createState() => _TransporterMainPageState();
}

class _TransporterMainPageState extends State<TransporterMainPage> {
  List screen = [
    TransporterHomePage(),
    const TransporterOrders(fromSettings: false),
    Tnotifications(),
    const TransporterSettingsScreen(),
  ];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find<AppController>();
    // appController.removeStorageData();

    debugPrint('apiTokern : ${appController.getApiToken()}');

    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: Text("Main".tr),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.outbox_rounded,
            ),
            title: const Text("الطلبات"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.notifications_none),
            title: Text("notifications".tr),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: Text("Settings".tr),
            selectedColor: Colors.green,
          ),
        ],
      ),
      body: screen[_currentIndex],
    );
  }
}
