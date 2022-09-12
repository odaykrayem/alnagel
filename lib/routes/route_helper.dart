import 'package:alnagel/Transporter/transporter_carriers.dart';
import 'package:alnagel/Transporter/transporter_services.dart';
import 'package:alnagel/Transporter/transporter_main.dart';
import 'package:alnagel/Transporter/transporter_add_offer.dart';
import 'package:alnagel/chatting_app/chatting_screen.dart';
import 'package:alnagel/chatting_app/messages_screen.dart';
import 'package:alnagel/choose_language_screen.dart';
import 'package:alnagel/create_account_screen.dart';
import 'package:alnagel/create_account_screen_2.dart';
import 'package:alnagel/join_as_screen.dart';
import 'package:alnagel/main.dart';
import 'package:alnagel/otp_screen.dart';
import 'package:alnagel/splash_screen.dart';
import 'package:alnagel/user/user_main_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const splashScreen = "/splash-scr";
  static const joinAsScreen = "/join-as-scr";
  static const chooseLanguageScreen = "/choose-lang-scr";
  static const userMainPage = "/user-main-page";
  static const transporterMainPage = "/transporter-main-page";
  static const createAccountScreen = "/create-account-scr";
  static const transporterAddOfferScreen = "/transporter-add-offer-scr";
  static const transporterCarriersScreen = "/transporter-carriers-scr";
  static const transporterServicesScreen = "/transporter-services-scr";
  static const otpScreen = "/otp-scr";

  static const chattingScreen = "/chatting-scr";
  static const messagesScreen = "/messages-scr";

  static const initial = "/";

  static String getSplashScreen() => splashScreen;
  static String getJoinAsScreen() => joinAsScreen;
  static String getChooseLanguageScreen() => chooseLanguageScreen;
  static String getUserMainPage() => userMainPage;
  static String getTransporterMainPage() => transporterMainPage;
  static String getCreateAccountScreen() => createAccountScreen;
  static String getTransporterAddOfferScreen(int orderId) =>
      '$transporterAddOfferScreen?orderId=$orderId';
  static String getTransporterCarriersScreen() => transporterCarriersScreen;
  static String getTransporterServicesScreen() => transporterServicesScreen;
  static String getOTPScreen(String verificationId, String userInfo) =>
      '$otpScreen?verifId=$verificationId&userInfo=$userInfo';

  static String getMessagesScreen() => messagesScreen;
  static String getChattingScreen(String chatId) =>
      '$chattingScreen?chatId=$chatId';

  static String getInitial() => initial;

  // static String getPopularFood(int pageId, String page) =>
  //     '$popularFood?pageId=$pageId&page=$page';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MyApp()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: chooseLanguageScreen, page: () => const ChooseLanguageScreen()),
    GetPage(name: joinAsScreen, page: () => const JoinAsScreen()),
    GetPage(name: userMainPage, page: () => const UserMainPage()),
    GetPage(name: transporterMainPage, page: () => const TransporterMainPage()),
    GetPage(
        name: createAccountScreen, page: () => const CreateAccountScreen2()),
    GetPage(
      name: transporterAddOfferScreen,
      page: () {
        var orderId = Get.parameters['orderId'];

        return TransporterAddOfferScreen(
          orderId: int.parse(orderId!),
        );
      },
    ),
    GetPage(
        name: transporterServicesScreen,
        page: () => const TransporterServicesScreen()),
    GetPage(
        name: transporterCarriersScreen,
        page: () => const TransporterCarriersScreen()),
    GetPage(name: messagesScreen, page: () => const MessagesScreen()),
    GetPage(
      name: chattingScreen,
      page: () {
        var chatId = Get.parameters['chatId'];

        return ChattingScreen(
          chatId: chatId!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: otpScreen,
      page: () {
        var verificationId = Get.parameters['verifId'];
        var userInfo = Get.parameters['userInfo'];

        return OTPScreen(
          verificationId: verificationId!,
          userInfo: userInfo!,
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
