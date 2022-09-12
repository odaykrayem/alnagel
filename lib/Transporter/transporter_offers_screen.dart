import 'package:alnagel/componant.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_offerrs_controller.dart';
import 'package:alnagel/models/offer_model.dart';
import 'package:alnagel/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransporterOffersScreen extends StatefulWidget {
  const TransporterOffersScreen({Key? key}) : super(key: key);

  @override
  _TransporterOffersScreenState createState() =>
      _TransporterOffersScreenState();
}

class _TransporterOffersScreenState extends State<TransporterOffersScreen> {
  String? tt;

  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    String apiToken = Get.find<AppController>().getApiToken()!;
    Get.find<TransporterOffersController>().getOffers({'token': apiToken});
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 150,
            width: 360,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(int.parse("0xff$hexString")),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(2),
                    topLeft: Radius.circular(2))),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Image.asset(
                  'assets/images/n.png',
                  height: 70,
                  width: 130,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: GetBuilder<TransporterOffersController>(
                builder: (offersController) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.teal,
                              )),
                          const Text(
                            'العروض',
                            style: TextStyle(color: Colors.teal),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            //withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        // textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          hintText: ('بحث'),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                          // hintTextDirection: TextDirection.rtl,
                          hintMaxLines: 1,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  const BorderSide(color: Colors.white70)),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      items('الكل'),
                      items('المستلمة'),
                      items('المرسلة'),
                      items('المكتملة'),
                    ],
                  ),
                  Row(
                    children: [
                      items('الملغية'),
                      items('قيد التنفيذ'),
                    ],
                  ),
                  SizedBox(
                      height: hi - 300,
                      child: offersController.isLoaded
                          ? ListView.builder(
                              itemCount: offersController.offersList.length,
                              itemBuilder: ((context, index) {
                                return offerItem(context,
                                    offersController.offersList[index]);
                              }))
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xff00afa0),
                              ),
                            ))
                ],
              );
            }),
          ),
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
    // }));
  }

  Widget itmes() {
    return Container(
      color: const Color.fromARGB(12, 0, 0, 0),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.notifications,
                color: Colors.black54,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'تمت الموافقة على عرضك',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              Icon(
                Icons.calendar_month_rounded,
                color: Colors.black54,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '02/05/2022',
                style: TextStyle(color: Colors.black54),
              )
            ],
          )
        ],
      ),
    );
  }

  InkWell items(String Tit) {
    return InkWell(
      onTap: () {
        setState(() {
          tt = Tit;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: tt == Tit
                ? Colors.teal
                : const Color.fromARGB(255, 216, 216, 216)),
        child: Text(
          Tit,
          style: TextStyle(color: tt == Tit ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget offerItem(BuildContext context, OfferModel offerModel) {
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).pushNamed('Torder_details');
      // },
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 82, 82, 82),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                    width: 100,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: const Center(
                        child: Text(
                      "تريله ماء",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'موقع التسليم',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                const Text('الرياض',
                                    style: TextStyle(fontSize: 11)),
                                const Text('شارع الحديقة',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'موقع الاستلام',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                const Text('المدينة',
                                    style: TextStyle(fontSize: 11)),
                                const Text('شارع النور',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 18,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'الموعد',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(getYeatMonth(offerModel.createdAt),
                                    style: const TextStyle(fontSize: 11)),
                                Text(getTime(offerModel.createdAt),
                                    style: const TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    ),
                                    Text(
                                      'السعر',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(offerModel.cost,
                                    style: const TextStyle(fontSize: 11)),
                                const Text('ر.س',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 330,
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text(
                          'قبول العرض',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
