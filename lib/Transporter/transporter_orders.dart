// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alnagel/componant.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_orders_controller.dart';
import 'package:alnagel/models/order_model.dart';

class TransporterOrders extends StatefulWidget {
  final bool fromSettings;
  const TransporterOrders({
    Key? key,
    required this.fromSettings,
  }) : super(key: key);

  @override
  _TransporterOrdersState createState() => _TransporterOrdersState();
}

class _TransporterOrdersState extends State<TransporterOrders> {
  int selectedItem = 0;

  List<String> orderItems = [
    'الكل',
    'المستلمة',
    'المرسلة',
    'المكتملة',
    'الملغية',
    'قيد التنفيذ',
  ];

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

  double listHieght = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String apiToken = Get.find<AppController>().getApiToken()!;

    if (widget.fromSettings) {
      listHieght = screenHeight - 370;
    } else {
      listHieght = screenHeight - 420;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: GetBuilder<TransporterOrdersController>(
                    builder: (ordersController) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: widget.fromSettings
                                      ? () {
                                          Navigator.of(context).pop();
                                        }
                                      : () {},
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.teal,
                                  )),
                              const Text(
                                'الطلبات',
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
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText: ('بحث'),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                              hintTextDirection: TextDirection.rtl,
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
                          orederTypeItem(
                              index: 0,
                              onTap: () {
                                setState(() {
                                  selectedItem = 0;
                                });
                                ordersController
                                    .getAllOrders({'token': apiToken});
                              }),
                          orederTypeItem(
                              index: 1,
                              onTap: () {
                                setState(() {
                                  selectedItem = 1;
                                });
                              }),
                          orederTypeItem(
                              index: 2,
                              onTap: () {
                                setState(() {
                                  selectedItem = 2;
                                });
                              }),
                          orederTypeItem(
                              index: 3,
                              onTap: () {
                                setState(() {
                                  selectedItem = 3;
                                });
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          orederTypeItem(
                              index: 4,
                              onTap: () {
                                setState(() {
                                  selectedItem = 4;
                                });
                              }),
                          orederTypeItem(
                              index: 5,
                              onTap: () {
                                setState(() {
                                  selectedItem = 5;
                                });
                                ordersController
                                    .getWaitOrders({'token': apiToken});
                              }),
                        ],
                      ),
                      SizedBox(
                        height: listHieght,
                        child: ordersController.isLoaded
                            ? ListView.builder(
                                itemCount: ordersController.ordersList.length,
                                itemBuilder: ((context, index) {
                                  return orderItem(context,
                                      ordersController.ordersList[index]);
                                }))
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff00afa0),
                                ),
                              ),
                      )
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

  // Widget itmes() {
  //   return Container(
  //     color: const Color.fromARGB(12, 0, 0, 0),
  //     margin: const EdgeInsets.all(5),
  //     padding: const EdgeInsets.all(5),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: const [
  //             Icon(
  //               Icons.notifications,
  //               color: Colors.black54,
  //             ),
  //             SizedBox(
  //               width: 8,
  //             ),
  //             Text(
  //               'تمت الموافقة على عرضك',
  //               style: TextStyle(color: Colors.black54),
  //             )
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Row(
  //           children: const [
  //             Icon(
  //               Icons.calendar_month_rounded,
  //               color: Colors.black54,
  //             ),
  //             SizedBox(
  //               width: 8,
  //             ),
  //             Text(
  //               '02/05/2022',
  //               style: TextStyle(color: Colors.black54),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  InkWell orederTypeItem({required int index, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selectedItem == index
                ? Colors.teal
                : const Color.fromARGB(255, 216, 216, 216)),
        child: Text(
          orderItems[index],
          style: TextStyle(
              color: selectedItem == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget orderItem(context, OrderModel orderModel) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('Torder_details');
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
                                const Text('02/7',
                                    style: TextStyle(fontSize: 11)),
                                const Text('9 ص',
                                    style: TextStyle(fontSize: 11)),
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
                                Text(orderModel.cost,
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
