import 'package:alnagel/bignaql.dart';
import 'package:alnagel/midumnaql.dart';
import 'package:alnagel/models/place.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:alnagel/smallnaql.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_maps_pick_place/google_maps_pick_place.dart';
import 'package:intl/intl.dart' as intt;

import 'controls/home_control.dart';

class naqlbuyinfo extends StatefulWidget {
  late String imagee;
  late String tt;
  naqlbuyinfo({required this.tt, required this.imagee});
  @override
  naqlbuyinfo2 createState() => naqlbuyinfo2(imagee: imagee, tt: tt);
}

class naqlbuyinfo2 extends State<naqlbuyinfo> {
  var newDateTime;

  TextEditingController calController = TextEditingController();
  final TextEditingController u = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  String? cost;
  double latitude = 0.0;
  double longitude = 0.0;

  double latitude1 = 0.0;
  double longitude1 = 0.0;
  home_Control _home_control = home_Control();
  PlaceLocation? pla;
  late String imagee;
  var newDateTimeIn;
  late String tt;
  naqlbuyinfo2({required this.tt, required this.imagee});
  String hexString = "00afa0";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              cubitapi co = cubitapi.get(context);

              return Scaffold(
                //appBar: AppBar(backgroundColor:Colors.teal ,
                // ),
                body: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8, top: 30),
                  child: SingleChildScrollView(
                      child: Container(
                          child: Column(
                    children: [
                      Row(textDirection: TextDirection.rtl, children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.navigate_next),
                          color: Colors.black26,
                        ),
                        Text(tt,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black26))
                      ]),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset(widget.imagee),
                      SizedBox(
                        height: 13,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                            controller: u,
                            decoration: InputDecoration(
                              labelText: 'ReceivingLocation'.tr,
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GoogleMapsPickPlace(
                                          apiKey:
                                              'AIzaSyAnl6vbNo5rdgfDvf0mdfmVZEMWkx8iKj0',
                                          getResult: (FullAddress fullAddress) {
                                            setState(() {
                                              u.text = fullAddress.address
                                                  .toString();
                                              latitude = fullAddress
                                                  .position!.latitude;
                                              longitude = fullAddress
                                                  .position!.longitude;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/Icon open-map-marker.png')),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'empty';
                              }

                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                            controller: toController,
                            decoration: InputDecoration(
                              labelText: 'deliveryLocation'.tr,
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GoogleMapsPickPlace(
                                          apiKey:
                                              'AIzaSyAnl6vbNo5rdgfDvf0mdfmVZEMWkx8iKj0',
                                          getResult: (FullAddress fullAddress) {
                                            setState(() {
                                              toController.text = fullAddress
                                                  .address
                                                  .toString();
                                              latitude1 = fullAddress
                                                  .position!.latitude;
                                              longitude1 = fullAddress
                                                  .position!.longitude;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/Icon open-map-marker.png')),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'empty';
                              }

                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(

                            //controller: u ,

                            decoration: InputDecoration(
                              labelText: newDateTime == null
                                  ? 'ChooseADate'.tr
                                  : intt.DateFormat('yyyy-MM-dd')
                                      .format(newDateTime),
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  newDateTime = await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 10),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10),
                                    // theme: ThemeData(primarySwatch: Colors.red),

                                    borderRadius: 2,
                                  );
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.date_range,
                                  color: Color(int.parse("0xff${hexString}")),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'empty';
                              }

                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Text('DriverNotes'.tr)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: noteController,
                          decoration: InputDecoration.collapsed(
                            hintTextDirection: TextDirection.rtl,
                            hintText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          minLines: 4,
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(' ريال 200 '))),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text('ApproximatePrice'.tr)))
                        ],
                      ),
                      Container(
                          child: Row(
                        children: [
                          Text(
                            'اقتراح سعر آخر'.tr,
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            controller: costController,
                            decoration: InputDecoration.collapsed(
                              hintTextDirection: TextDirection.rtl,
                              hintText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (val) {
                              cost = val;
                            },
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 4,
                            maxLines: 4,
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _home_control.add_order(
                              context,
                              tt,
                              cost ?? 200.toString(),
                              noteController.text.toString(),
                              u.text.toString(),
                              toController.text.toString(),
                              newDateTimeIn.toString(),
                              '$latitude',
                              '$longitude',
                              '$latitude1',
                              '$longitude1');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(int.parse("0xff${hexString}")),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 300,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            'send'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ))),
                ),
              );
            }));
  }
}
