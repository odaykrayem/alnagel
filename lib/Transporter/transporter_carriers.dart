// ignore_for_file: file_names

import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_carrier_controller.dart';
import 'package:alnagel/models/carrier_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterCarriersScreen extends StatefulWidget {
  const TransporterCarriersScreen({Key? key}) : super(key: key);

  @override
  _TransporterCarriersScreenState createState() =>
      _TransporterCarriersScreenState();
}

class _TransporterCarriersScreenState extends State<TransporterCarriersScreen> {
  TextEditingController tanker_length_Cont = TextEditingController();
  TextEditingController tanker_Weight_Cont = TextEditingController();
  var tanker;
  var choosedTankerIndex = 0;
  bool isTapped = true;
  bool isExpanded = false;

  String? tt;

  String hexString = "00afa0";

  List<String> dropDownItems = [
    'تريله ستارة',
    "تريلة قلاب",
    "تريلة ماء",
  ];

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;

    String apiToken = Get.find<AppController>().getApiToken()!;
    Get.find<TransporterCarrierController>().getCarriers({'token': apiToken});

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
          child: Container(
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
                          'ناقلاتي',
                          style: TextStyle(color: Colors.teal),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'استعراض الناقلات السابقة',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     conveyor_type(
                //         wi, 'assets/images/Mask Group 25.png', 'ناقلة كبيرة'),
                //     conveyor_type(
                //         wi, 'assets/images/Mask Group 13.png', 'ناقلة متوسطة'),
                //     conveyor_type(
                //         wi,
                //         'assets/images/800px-2018_Ford_Transit_Custom_300_Base_2.0_facelift-removebg-preview (1).png',
                //         'ناقلة صغيرة'),
                //   ],
                // ),
                GetBuilder<TransporterCarrierController>(
                    builder: (carrierController) {
                  return carrierController.isLoaded
                      ? SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: carrierController.carriersList.length,
                              itemBuilder: (context, index) {
                                return carrierItem(
                                    wi,
                                    carrierController.carriersList[index],
                                    () {});
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
                      'تفاصيل الناقلة',
                      style: TextStyle(color: Colors.teal, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                form('طول الناقلة', tanker_length_Cont, TextInputType.number),
                const SizedBox(
                  height: 15,
                ),
                form('وزن الناقلة', tanker_Weight_Cont, TextInputType.number),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'نوع الناقلة',
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
                        items: dropDownItems
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
                            choosedTankerIndex = dropDownItems
                                .indexWhere((element) => element == newValue);
                          });
                        },
                        isExpanded: true,
                        hint: Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'نوع الناقلة',
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
                ElevatedButton(
                  onPressed: () {
                    String apiToken = Get.find<AppController>().getApiToken()!;
                    Get.find<TransporterCarrierController>().addCarrier({
                      'token': apiToken,
                      'type': choosedTankerIndex,
                      'size': 0.0,
                      'tall': double.parse(tanker_length_Cont.text),
                      'weight': double.parse(tanker_Weight_Cont.text)
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
      ))),

      // bottomNavigationBar: bottomnavbar(co)
    );
  }

  Column form(String Title, controllerText, TextInputType type) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            Title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
          ),
        ),
        TextFormField(
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
              hintText: Title),
        ),
      ],
    );
  }

  InkWell conveyor_type(double wi, String im, String Title) {
    return InkWell(
      onTap: () {
        setState(() {
          tt = Title;
        });
      },
      child: Container(
        height: 105,
        width: wi / 3.5,
        decoration: BoxDecoration(
            color: tt == Title ? Colors.teal : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal)),
        child: Column(
          children: [
            Image.asset(
              im,
              height: 80,
            ),
            Text(
              Title,
              style: TextStyle(color: tt == Title ? Colors.white : Colors.teal),
            )
          ],
        ),
      ),
    );
  }

  InkWell carrierItem(
      double screenWidth, CarrierModel carrierModel, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 105,
        width: screenWidth / 3.5,
        margin: EdgeInsets.symmetric(horizontal: screenWidth / 75),
        decoration: BoxDecoration(
            color: tt == Title ? Colors.teal : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Mask Group 25.png',
              height: 80,
            ),
            Text(
              dropDownItems[carrierModel.type],
              style: TextStyle(color: tt == Title ? Colors.white : Colors.teal),
            )
          ],
        ),
      ),
    );
  }
}
