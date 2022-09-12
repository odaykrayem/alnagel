import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_carrier_controller.dart';
import 'package:alnagel/logale/locale_Cont.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.cover)),
      ),
      SizedBox(
          width: 230, height: 200, child: Image.asset('assets/images/n.png')),
    ]);
  }

  @override
  void initState() {
    super.initState();
    Get.put(MyLocaleController(), permanent: true);
    Get.put(TransporterCarrierController(transporterCarrierRepo: Get.find()),
        permanent: true);
    // Get.put(MyLocaleController(), permanent: true);
    // Get.put(MyLocaleController(), permanent: true);
    // Get.put(MyLocaleController(), permanent: true);

    AppController appController = Get.find<AppController>();

    Future.delayed(const Duration(seconds: 5), () {
      if (appController.getLanguageCode() != null) {
        Get.find<MyLocaleController>()
            .changeLang(appController.getLanguageCode()!);
      }
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      //   return appController.getLanguageCode() == null
      //       ? const ChooseLanguageScreen()
      //       : appController.getApiToken() == null
      //           ? const JoinAsScreen()
      //           : appController.getUserType() == AppConstants.USER_TYPE_USER
      //               ? UserMainPage()
      //               : TransporterMainPage();
      // }));

      Get.toNamed(appController.getLanguageCode() == null
          ? RouteHelper.getChooseLanguageScreen()
          : appController.getApiToken() == null
              ? RouteHelper.getJoinAsScreen()
              : appController.getUserType() == AppConstants.USER_TYPE_USER
                  ? RouteHelper.getUserMainPage()
                  : RouteHelper.getTransporterMainPage());
    });
  }
}
