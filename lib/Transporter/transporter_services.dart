import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_service_controller.dart';
import 'package:alnagel/models/service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterServicesScreen extends StatefulWidget {
  const TransporterServicesScreen({Key? key}) : super(key: key);

  @override
  _TransporterServicesScreenState createState() =>
      _TransporterServicesScreenState();
}

class _TransporterServicesScreenState extends State<TransporterServicesScreen> {
  TextEditingController noteController = TextEditingController();
  String hexString = "00afa0";
  var tanker;

  @override
  Widget build(BuildContext context) {
    String apiToken = Get.find<AppController>().getApiToken()!;
    Get.find<TransporterServiceController>().getServices({'token': apiToken});

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                color: Color(int.parse("0xff${hexString}")),
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
            child: Column(
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
                          'خدماتي',
                          style: TextStyle(color: Colors.teal),
                        )
                      ],
                    ),
                  ],
                ),
                GetBuilder<TransporterServiceController>(
                    builder: (serviceController) {
                  return serviceController.isLoaded
                      ? SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: serviceController.servicesList.length,
                              itemBuilder: (context, index) {
                                return serviceItem(
                                    serviceController.servicesList[index]);
                              }),
                        )
                      : const CircularProgressIndicator(
                          color: Color(0xff00afa0),
                        );
                }),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Text(
                      'تفاصيل الخدمة',
                      style: TextStyle(color: Colors.teal, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'نوع الخدمة',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.black54)),
                      child: DropdownButton<dynamic>(
                        items: [
                          'توصيل وتنسيق زهور',
                          "توصيل بضائع جملة",
                          "توصيل حلويات",
                          "متنوعة / اخرى",
                        ]
                            .map((e) => DropdownMenuItem(
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            tanker = newValue;
                          });
                        },
                        isExpanded: true,
                        hint: Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'نوع الخدمة',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                        value: tanker,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                form('ملاحظات', noteController, TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    var apiToken = Get.find<AppController>().getApiToken();
                    Get.find<TransporterServiceController>().addService({
                      'token': apiToken,
                      'type': tanker,
                      'detail': noteController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 196, 177),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 330,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'اضافة',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
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

  Widget serviceItem(ServiceModel service) {
    return Container(
        width: 130,
        height: 120,
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xff00afa0)),
            color: Colors.white),
        child: Stack(
          children: [
            const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  CupertinoIcons.pencil_ellipsis_rectangle,
                  color: Color(0xff00afa0),
                )),
            SizedBox(
              width: 130,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/52240-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    service.type,
                    style: const TextStyle(
                        color: Color(0xff00afa0), fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
