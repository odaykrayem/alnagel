// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/user/user_offer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/user_offers_controller.dart';
import 'package:alnagel/models/my_requests.dart';
import 'package:alnagel/models/user_offer_model.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:alnagel/utils/date_formatter.dart';
import '../models/my_requests.dart';

class orderdetails extends StatefulWidget {
  final MyRequest req;

  const orderdetails({
    Key? key,
    required this.req,
  }) : super(key: key);
  @override
  _orderdetailsState createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  String apiToken = Get.find<AppController>().getApiToken()!;

  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    debugPrint('orderdetail : ${widget.req.id}');
    Get.find<UserOffersController>()
        .getOrderOffers({'token': apiToken, 'id': widget.req.id});
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              cubitapi co = cubitapi.get(context);
              //TODO
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Text(
                    'رجوع',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                body:
                    //SingleChildScrollView(
                    //child:
                    SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              //textDirection: TextDirection.rtl,
                              children: [
                                Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'YourOrderDetails'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.req.type.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  //crossAxisAlignment:CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.req.from.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('ReceivingLocation'.tr),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.req.to.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('deliveryLocation'.tr),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 7),
                                      child: Row(
                                        //crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,

                                        children: [
                                          Text('DriverNotes'.tr),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 15,),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          widget.req.notes.toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.grey),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  //textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'PaymentDetails'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      widget.req.cost,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      (double.parse(widget
                                                                  .req.cost) *
                                                              0.15)
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      (double.parse(widget
                                                                  .req.cost) +
                                                              (double.parse(widget
                                                                      .req
                                                                      .cost) *
                                                                  0.15))
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ))),
                                        Expanded(
                                            child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'cost'.tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'valueAddedTax'.tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Total'.tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ))),
                                      ],
                                    )
                                  ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                'العروض'.tr,
                                style: const TextStyle(color: Colors.teal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: GetBuilder<UserOffersController>(
                              builder: (controller) {
                            return controller.isLoaded
                                ? ListView.builder(
                                    itemCount: controller.offersList.length,
                                    itemBuilder: ((context, index) => offerItem(
                                        controller.offersList[index])))
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff00afa0),
                                    ),
                                  );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget offerItem(UserOfferModel userOfferModel) {
    debugPrint('userOfferModel ${userOfferModel.id}');
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => UserOfferDetails(
                      userOfferModel: userOfferModel,
                    ))));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userOfferModel.userName ?? ''),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'ARequestHasBeenSentFromTheDriver'.tr,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userOfferModel.cost,
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(Icons.attach_money_rounded,
                          color: Colors.grey),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(userOfferModel.type ?? '',
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(
                        Icons.work_outline_rounded,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(getTime(userOfferModel.createdAt),
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(Icons.access_time, color: Colors.grey),
                    ]),
              ]),
              const SizedBox(
                width: 35,
              ),
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.teal,
              ),
            ]),
          ),
        ),
        Container(width: 300, child: const Divider()),
      ],
    );
  }
}
