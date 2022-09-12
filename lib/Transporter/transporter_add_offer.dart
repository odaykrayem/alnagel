import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_offerrs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/TmainW.dart';

class TransporterAddOfferScreen extends StatefulWidget {
  final int orderId;
  const TransporterAddOfferScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  _TransporterOrderDetailsState createState() =>
      _TransporterOrderDetailsState();
}

class _TransporterOrderDetailsState extends State<TransporterAddOfferScreen> {
  TextEditingController noteController = TextEditingController();
  TextEditingController costController = TextEditingController();

  String hexString = "00afa0";

  String? note;
  int? offerCost;
  String? apiToken;

  @override
  Widget build(BuildContext context) {
    debugPrint('nnnnnnnnnnnnnnnnnnnnnnnnn${widget.orderId}');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    apiToken = Get.find<AppController>().getApiToken();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 203, 203),
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
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 3, 184, 166),
                        )),
                    const Text("تفاصيل طلب توصيل",
                        style:
                            TextStyle(color: Color.fromARGB(255, 3, 184, 166))),
                  ],
                ),
                Container(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
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
                              // height: 250,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.location_on_sharp,
                                                  color: Colors.teal),
                                              Text(
                                                'موقع التسليم',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 11),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                    color: Colors.teal,
                                                    fontSize: 11),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                    color: Colors.teal,
                                                    fontSize: 11),
                                              )
                                            ],
                                          ),
                                          const Text('02/7',
                                              style: TextStyle(fontSize: 11)),
                                          const Text('9 ص',
                                              style: TextStyle(fontSize: 11)),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                "\$",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                'السعر',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 11),
                                              )
                                            ],
                                          ),
                                          const Text('5000',
                                              style: TextStyle(fontSize: 11)),
                                          const Text('ر.س',
                                              style: TextStyle(fontSize: 11)),
                                        ],
                                      )
                                    ],
                                  ),
                                  form('ملاحظة للسائق', noteController,
                                      TextInputType.text),
                                  const SizedBox(
                                    height: 35,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              child: ElevatedButton(
                                onPressed: () {
                                  showMessageDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(height: 50),
                Row(
                  children: const [
                    Text("عروض مشابهه",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 2, 138, 124))),
                  ],
                ),
                SizedBox(
                  height: height - 400,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return requests(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
  }

  void showMessageDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                    height: height - 400,
                    width: width - 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Center(
                          child: Text(
                            'عزيزي الناقل',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'هل أنت متأكد من إرسال هذا العرض',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: (height - 400) / 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showEnterCostDialog(context);
                                  },
                                  child: const Text(
                                    'موافق',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff00afa0)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              side: const BorderSide(
                                                  color: Color(0xff00afa0))))),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff00afa0),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              side: const BorderSide(
                                                  color: Color(0xff00afa0))))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
  }

  void showEnterCostDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return GetBuilder<TransporterOffersController>(
                      builder: (controller) {
                    return Container(
                      height: height - 400,
                      width: width - 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Center(
                            child: Text(
                              'عزيزي الناقل',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'الرجاء إدخال السعر المقترح',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.teal,
                              controller: costController,
                              onChanged: (newVal) {
                                offerCost = int.parse(newVal);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: (height - 400) / 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.find<TransporterOffersController>()
                                          .addOffer({
                                        'token': apiToken,
                                        'cost': '$offerCost',
                                        'id': '${widget.orderId}',
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'موافق',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff00afa0)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                side: const BorderSide(
                                                    color:
                                                        Color(0xff00afa0))))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'إلغاء',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff00afa0),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                side: const BorderSide(
                                                    color:
                                                        Color(0xff00afa0))))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ));
  }

  Column form(String title, controllerText, TextInputType type) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
          ),
        ),
        TextFormField(
          maxLines: 3,
          keyboardType: type,
          cursorColor: Colors.teal,
          controller: controllerText,
          onChanged: (newVal) {
            note = newVal;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black54)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black54)),
              hintText: 'ملاحظات للعميل'),
        ),
      ],
    );
  }
}
