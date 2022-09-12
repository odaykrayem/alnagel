// ignore: file_names
import 'package:alnagel/Transporter/TInvoices.dart';
import 'package:alnagel/Transporter/transporter_reviews_sreen.dart';
import 'package:alnagel/Transporter/Tfavourite.dart';
import 'package:alnagel/Transporter/Twallet.dart';
import 'package:alnagel/Transporter/transporter_offers_screen.dart';
import 'package:alnagel/Transporter/transporter_orders.dart';
import 'package:alnagel/Transporter/transporter_tracking_screen.dart';
import 'package:alnagel/chatting_app/features/chat/widgets/contacts_list.dart';
import 'package:alnagel/conditions.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/main.dart';
import 'package:alnagel/models/User.dart';
import 'package:alnagel/models/marker_model.dart';
import 'package:alnagel/problems.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/shareapp.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:alnagel/splash_screen.dart';
import 'package:alnagel/user/user_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../paymntnotdoneinconversation.dart';

class TransporterSettingsScreen extends StatefulWidget {
  const TransporterSettingsScreen({Key? key}) : super(key: key);

  @override
  _TransporterSettingsScreenState createState() =>
      _TransporterSettingsScreenState();
}

class _TransporterSettingsScreenState extends State<TransporterSettingsScreen> {
  // User_Control userControl = User_Control();

  User? user;

  @override
  void initState() {
    // user_control.getprofile().then((value) => setState((){
    //   user=value;
    // }));
    MarkerModel().init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Get.find<AppController>().getUserInfo();
    return BlocProvider(
        create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              // cubitapi co = cubitapi.get(context);
              return Scaffold(
                  body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 6, left: 6),
                          child: Container(
                              child: Column(children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('Settings'.tr),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit,
                                              size: 14))),
                                  Container(
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        radius: 40,
                                        child: Image.asset(
                                            'assets/images/Group 8773.png'),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Center(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user!.name,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 14,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            // items(
                            //     context,
                            //     'user test',
                            //     const Icon(
                            //       Icons.location_on_sharp,
                            //       color: Colors.grey,
                            //     ),
                            //     UserTrackingScreen()),
                            // const SizedBox(
                            //   height: 6,
                            // ),
                            // items(
                            //     context,
                            //     'بدء التسليم',
                            //     const Icon(
                            //       Icons.location_on_sharp,
                            //       color: Colors.grey,
                            //     ),
                            //     TransporterTrackingScreen()),
                            // const SizedBox(
                            //   height: 6,
                            // ),
                            items(
                                context,
                                'العروض',
                                const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.grey,
                                ),
                                TransporterOffersScreen()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'طلباتي',
                                const Icon(
                                  Icons.outbox_rounded,
                                  color: Colors.grey,
                                ),
                                TransporterOrders(
                                  fromSettings: true,
                                )
                                // const TransporterOrders(),
                                ),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'تعديل بياناتي',
                                const Icon(
                                  Icons.mode_edit_outline_rounded,
                                  color: Colors.grey,
                                ),
                                TransporterReviewsScreen()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'التقييم',
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.grey,
                                ),
                                const TransporterReviewsScreen()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'محفظتي',
                                const Icon(
                                  Icons.business_center_sharp,
                                  color: Colors.grey,
                                ),
                                Twallet()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'فواتيري',
                                const Text(
                                  '\$',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.grey),
                                ),
                                TInvoices()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'مفضلتي',
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                                Tfavourite()),
                            const SizedBox(
                              height: 6,
                            ),
                            items(
                                context,
                                'رسائلي',
                                const Icon(
                                  Icons.mark_as_unread_sharp,
                                  color: Colors.grey,
                                ),
                                ContactsList()),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                conditions()));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('TermsAndConditions'.tr),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.info_outline,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => problems()));
                                  },
                                  child: Row(
                                    // crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Text('ComplaintsAndSuggestions'.tr),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.message_outlined,
                                          color: Colors.grey),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => shareapp()));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('ShareTheApp'.tr),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.share,
                                          color: Colors.grey),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                    showDialog(
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        content: Container(
                                            height: 250,
                                            child: Column(
                                              children: [
                                                Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.close))),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                Container(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                        'assets/images/Group 8923.png')),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: OutlinedButton(
                                                            style: ButtonStyle(
                                                                side:
                                                                    MaterialStateProperty
                                                                        .all(
                                                              const BorderSide(
                                                                width: 1,
                                                                color:
                                                                    Colors.teal,
                                                              ),
                                                            )),
                                                            onPressed: () {
                                                              Get.find<
                                                                      AppController>()
                                                                  .removeStorageData();
                                                              Get.toNamed(
                                                                  RouteHelper
                                                                      .getSplashScreen());
                                                              // Navigator.of(
                                                              //         context)
                                                              //     .pushReplacement(
                                                              //         MaterialPageRoute(
                                                              //             builder: (context) =>
                                                              //                 Splas()));
                                                            },
                                                            child: Text(
                                                              'Exit'.tr,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .teal),
                                                            ))),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                            'Cancellation'.tr),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .teal),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                      ),
                                      context: context,
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('LogOut'.tr),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.logout,
                                          color: Colors.grey),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ])))));
            }));
  }

  SizedBox items(BuildContext context, String Title, Widget wi, push) {
    return SizedBox(
      height: 50,
      child: FlatButton(
          color: Colors.black12,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => push));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(Title),
              const SizedBox(
                width: 10,
              ),
              wi
            ],
          )),
    );
  }
}
