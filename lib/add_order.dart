import 'package:alnagel/controls/home_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_maps_pick_place/google_maps_pick_place.dart';

class add_order extends StatefulWidget {
  String? t;
  String? image;
  add_order({this.t, this.image});
  @override
  _add_orderState createState() => _add_orderState();
}

class _add_orderState extends State<add_order> {
  String hexString = "00afa0";
  final TextEditingController u = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  var newDateTimeIn;
  home_Control _home_control = home_Control();

  double latitude = 0.0;
  double longitude = 0.0;

  double latitude1 = 0.0;
  double longitude1 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(textDirection: TextDirection.rtl, children: [
          Icon(
            Icons.navigate_next,
            color: Colors.black26,
          ),
          Text(widget.t!, style: TextStyle(fontSize: 16, color: Colors.black26))
        ]),
        SizedBox(
          height: 8,
        ),
        Image.asset(widget.image!),
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
                          builder: (context) => GoogleMapsPickPlace(
                            apiKey: 'AIzaSyAnl6vbNo5rdgfDvf0mdfmVZEMWkx8iKj0',
                            getResult: (FullAddress fullAddress) {
                              setState(() {
                                u.text = fullAddress.address.toString();
                                latitude = fullAddress.position!.latitude;
                                longitude = fullAddress.position!.longitude;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child:
                        Image.asset('assets/images/Icon open-map-marker.png')),
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
                          builder: (context) => GoogleMapsPickPlace(
                            apiKey: 'AIzaSyAnl6vbNo5rdgfDvf0mdfmVZEMWkx8iKj0',
                            getResult: (FullAddress fullAddress) {
                              setState(() {
                                toController.text =
                                    fullAddress.address.toString();
                                latitude1 = fullAddress.position!.latitude;
                                longitude1 = fullAddress.position!.longitude;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child:
                        Image.asset('assets/images/Icon open-map-marker.png')),
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
                labelText: newDateTimeIn == null
                    ? 'ChooseADate'.tr
                    : newDateTimeIn.toString(),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    newDateTimeIn = await showRoundedDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10),
                      lastDate: DateTime(DateTime.now().year + 10),
                      // theme: ThemeData(primarySwatch: Colors.red),

                      borderRadius: 2,
                    );
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
              alignment: Alignment.topRight, child: Text('DriverNotes'.tr)),
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
                    alignment: Alignment.topLeft, child: Text(' ريال 200 '))),
            SizedBox(
              width: 70,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text('ApproximatePrice'.tr)))
          ],
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            _home_control.add_order(
                context,
                widget.t!,
                200.toString(),
                noteController.text.toString(),
                u.text.toString(),
                toController.text.toString(),
                newDateTimeIn.toString(),
                '55',
                '66',
                '22',
                '33');
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
