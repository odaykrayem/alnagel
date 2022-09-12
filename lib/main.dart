import 'package:alnagel/chatting_app/messages_screen.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_carrier_controller.dart';
import 'package:alnagel/controllers/transporter_offerrs_controller.dart';
import 'package:alnagel/controllers/transporter_orders_controller.dart';
import 'package:alnagel/controllers/transporter_service_controller.dart';
import 'package:alnagel/controllers/user_banners_controller.dart';
import 'package:alnagel/controllers/user_offers_controller.dart';
import 'package:alnagel/logale/locale_Cont.dart';
import 'package:alnagel/logale/localization.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:alnagel/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Get.put(MyLocaleController());

    // if (Get.find<AppController>().getApiToken() != null) {
    //   String apiToken = Get.find<AppController>().getApiToken()!;

    //   Get.find<TransporterCarrierController>().getCarriers({'token': apiToken});
    //   Get.find<TransporterOrdersController>()
    //       .getWaitOrders({'token': apiToken});
    // }

    return GetBuilder<AppController>(builder: (_) {
      return GetBuilder<MyLocaleController>(builder: (_) {
        return GetBuilder<TransporterOffersController>(builder: (_) {
          return GetBuilder<TransporterServiceController>(builder: (_) {
            return GetBuilder<TransporterCarrierController>(builder: (_) {
              return GetBuilder<UserOffersController>(builder: (_) {
                return GetBuilder<UserBannerController>(builder: (_) {
                  return GetBuilder<TransporterOrdersController>(builder: (_) {
                    return GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      translations: AppLocalization(),
                      theme: ThemeData(fontFamily: 'vip_bold'),
                      // home: MessagesScreen(),
                      initialRoute: RouteHelper.getSplashScreen(),
                      getPages: RouteHelper.routes,
                      //TODO
                      // locale: Locale('en'),
                      // routes: {
                      //   'Tcarriers': (context) => TransporterCarriers(),
                      //   'my_services': (context) => my_services(),
                      //   'Torder_details': (context) => Torder_details()
                      // },
                    );
                  });
                });
              });
            });
          });
        });
      });
    });
  }
}
