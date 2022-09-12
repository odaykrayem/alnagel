// ignore_for_file: file_names

import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_orders_controller.dart';
import 'package:alnagel/models/order_model.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:alnagel/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterHomePage extends StatefulWidget {
  const TransporterHomePage({Key? key}) : super(key: key);

  @override
  _TransporterHomePageState createState() => _TransporterHomePageState();
}

class _TransporterHomePageState extends State<TransporterHomePage> {
  bool isTapped = true;
  bool isExpanded = false;

  String hexString = "00afa0";

  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    String apiToken = Get.find<AppController>().getApiToken()!;
    Get.find<TransporterOrdersController>().getAllOrders({'token': apiToken});
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  String userName = Get.find<AppController>().getUserInfo()!.name;

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 206, 203, 203),
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextFormField(
                cursorColor: Colors.grey,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: ('LookingForATanker'.tr),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                  hintTextDirection: TextDirection.rtl,
                  hintMaxLines: 1,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.white70)),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          animatedCont(),
          Container(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(

                    //TODO:
                    child: firstItems(wi, "ناقلاتي", "إضافة ناقلة جديدة",
                        context, RouteHelper.getTransporterCarriersScreen())),
                Expanded(
                    child: firstItems(wi, "خدماتي", "إضافة خدمة جديدة", context,
                        RouteHelper.getTransporterServicesScreen())),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("أحدث طلبات التوصيل",
                        style:
                            TextStyle(color: Color.fromARGB(255, 3, 184, 166))),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "عرض الكل",
                          style: TextStyle(
                              color: Color.fromARGB(255, 3, 202, 182)),
                        ))
                  ],
                ),
                Container(
                  height: hi - 400,
                  child: GetBuilder<TransporterOrdersController>(
                      builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.ordersList.length,
                      itemBuilder: (context, index) {
                        return listItem(controller.ordersList[index]);
                      },
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
  }

  Widget animatedCont() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            isTapped = !isTapped;
          });
        },
        onHighlightChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped
              ? isExpanded
                  ? 65
                  : 70
              : isExpanded
                  ? 225
                  : 230,
          width: isExpanded ? 385 : 390,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 176, 234, 229).withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: isTapped
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black54,
                              size: 27,
                            ),
                            Text(
                              'اهلا ' + userName,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.chat,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black54,
                              size: 27,
                            ),
                            const Text(
                              'اهلا محمد!',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.chat,
                          color: Colors.black54,
                        )
                      ],
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("الرصيد الكلي"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("25000 ح.م"),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: const [
                              Text("الرصيد المتاح للسحب"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("500 ح.م"),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: const [
                              Text("الشحنات المكتملة"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("15"),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "الشحنات القيد تنفيذ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 191, 172),
                                    fontSize: 11),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("5"),
                            ],
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: const [
                              Text("الوقت المتوقع للتوصيل",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 2, 191, 172),
                                      fontSize: 11)),
                              SizedBox(
                                height: 8,
                              ),
                              Text("23.20 س"),
                            ],
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: const [
                              Text("الوقت المتوقع للتوصيل",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 2, 191, 172),
                                      fontSize: 11)),
                              SizedBox(
                                height: 8,
                              ),
                              Text("23.20 س"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

Widget listItem(OrderModel orderModel) {
  return InkWell(
    onTap: () {
      // Navigator.of(context).pushNamed('Torder_details');
      Get.toNamed(RouteHelper.getTransporterAddOfferScreen(orderModel.id));
    },
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
                  child: Center(
                      child: Text(
                    orderModel.type,
                    style: const TextStyle(color: Colors.white),
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
                              Text(orderModel.from,
                                  // overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 11)),
                              const Text('', style: TextStyle(fontSize: 11)),
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
                              Text(orderModel.to,
                                  style: const TextStyle(fontSize: 11)),
                              const Text('', style: TextStyle(fontSize: 11)),
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
                              Text(getTime(orderModel.createdAt),
                                  style: TextStyle(fontSize: 11)),
                              const Text('9 ص', style: TextStyle(fontSize: 11)),
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
                              Text(orderModel.cost,
                                  style: const TextStyle(fontSize: 11)),
                              const Text('ر.س', style: TextStyle(fontSize: 11)),
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
                    onPressed: () {
                      Get.toNamed(RouteHelper.getTransporterAddOfferScreen(
                          orderModel.id));
                    },
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
                        'قدم العرض الان',
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

Widget firstItems(
    double wi, String title, String subTitle, context, String pageName) {
  return InkWell(
    onTap: () {
      // Navigator.of(context).pushNamed(push);
      Get.toNamed(pageName);
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      color: Colors.white,
      width: wi / 3.6,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 3, 184, 166)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Icon(
                  Icons.add,
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

// Widget bottomnavbar(cubitapi co) {
//   return Container(
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//             topRight: const Radius.circular(10),
//             topLeft: const Radius.circular(10)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             //withOpacity(0.5),
//             spreadRadius: 12,
//             blurRadius: 7,
//             offset: const Offset(6, 6), // changes position of shadow
//           )
//         ]),
//     child: ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topRight: const Radius.circular(20),
//         topLeft: const Radius.circular(20),
//       ),
//       child: BottomNavigationBar(
//         selectedLabelStyle: const TextStyle(color: Colors.teal),
//         unselectedLabelStyle: const TextStyle(color: Colors.grey),
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedItemColor: Colors.teal,
//         unselectedItemColor: Colors.grey,
//         currentIndex: co.currentindex,
//         onTap: (index) {
//           co.onchange(index);
//         },
//         items: co.bottomitem,
//       ),
//     ),
//   );
// }
