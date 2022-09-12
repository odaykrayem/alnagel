import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_carrier_controller.dart';
import 'package:alnagel/controllers/transporter_offerrs_controller.dart';
import 'package:alnagel/controllers/transporter_orders_controller.dart';
import 'package:alnagel/controllers/transporter_rate_controller.dart';
import 'package:alnagel/controllers/transporter_service_controller.dart';
import 'package:alnagel/controllers/user_banners_controller.dart';
import 'package:alnagel/controllers/user_offers_controller.dart';
import 'package:alnagel/data/api/api_client.dart';
import 'package:alnagel/data/repoistory/app_repo.dart';
import 'package:alnagel/data/repoistory/tranporter_services_repo.dart';
import 'package:alnagel/data/repoistory/transporter_carrier_repo.dart';
import 'package:alnagel/data/repoistory/transporter_offers_repo.dart';
import 'package:alnagel/data/repoistory/transporter_orders_repo.dart';
import 'package:alnagel/data/repoistory/transporter_rate_repo.dart';
import 'package:alnagel/data/repoistory/user_banners_repo.dart';
import 'package:alnagel/data/repoistory/user_offers_repo.dart';
import 'package:alnagel/logale/locale_Cont.dart';
import 'package:alnagel/models/user_offer_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  //TODO:  Add base url

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //API clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos

  Get.lazyPut(() => AppRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => TransporterServicesRepo(apiClient: Get.find()));
  Get.lazyPut(() => TransporterCarrierRepo(apiClient: Get.find()));
  Get.lazyPut(() => TransporterOrdersRepo(apiClient: Get.find()));
  Get.lazyPut(() => TransporterOffersRepo(apiClient: Get.find()));
  Get.lazyPut(() => TransporterRateRepo(apiClient: Get.find()));

  //USER
  Get.lazyPut(() => UserBannersRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserOffersRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => MyLocaleController());
  Get.lazyPut(() => AppController(appRepo: Get.find()));
  Get.lazyPut(
      fenix: true,
      () => TransporterServiceController(transporterServicesRepo: Get.find()));
  Get.lazyPut(
      () => TransporterCarrierController(transporterCarrierRepo: Get.find()));
  Get.lazyPut(
      () => TransporterOrdersController(transporterOrdersRepo: Get.find()));

  Get.lazyPut(
      () => TransporterOffersController(transporterOffersRepo: Get.find()));
  Get.lazyPut(() => TransporterRateController(transporterRateRepo: Get.find()));

  //USER
  Get.lazyPut(() => UserBannerController(userBannersRepo: Get.find()));
  Get.lazyPut(() => UserOffersController(userOffersRepo: Get.find()));
}
