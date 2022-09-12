import 'package:alnagel/Map_screen.dart';
import 'package:alnagel/controls/home_control.dart';
import 'package:alnagel/models/banner_model.dart';
import 'package:alnagel/naqlbuyinformation.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/writeproblem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'orderrace.dart';

String hexString = "00afa0";
final TextEditingController u = TextEditingController();
final TextEditingController noteController = TextEditingController();
final TextEditingController toController = TextEditingController();
var newDateTimeIn;
String serverUrl = "https://sicspider.com/alangel/public/api";
String ImageUrl = "https://sicspider.com/alangel/public/img/";

Widget myrow(String t) => Row(textDirection: TextDirection.rtl, children: [
      const Icon(
        Icons.navigate_next,
        color: Colors.grey,
      ),
      Text(t,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey))
    ]);

Widget naql(
        int n,
        @required String t,
        @required String k,
        @required List<String> kl,
        @required List<String> image,
        home_Control _home_control) =>
    // SingleChildScrollView(
// child:
    Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
                Text(t,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 17.0),
            child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  k,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          // SizedBox(height: 10,),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: n,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                child:
                    //OutlinedButton(
                    //onPressed: () {  },style:
                    //ButtonStyle(side: MaterialStateProperty.all(BorderSide( width:2 ,
                    //color: Colors.teal,),),
                    //shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                    //),

                    //    child:
                    Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.cyanAccent]),
                    border: Border.all(
                        color: Color(int.parse("0xff${hexString}")), width: 1),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        topLeft: Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      //  ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => naqlbuyinfo(
                                      tt: kl[index], imagee: image[index])));
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey,
                            alignment: Alignment.center,
                            primary: Colors.white,
                            fixedSize: const Size(200, 40),
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius: const BorderRadius.only(
                              topRight: const Radius.circular(10),
                              topLeft: const Radius.circular(10),
                              bottomRight: Radius.circular(5),
                              bottomLeft: const Radius.circular(5),
                            ))),
                        child: Text(
                          kl[index],
                          style: TextStyle(
                              color: Color(int.parse("0xff${hexString}")),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),

                      //SizedBox(height: 10,),
                      Expanded(
                        child: Container(
                            width: MediaQuery.of(context)
                                .size
                                .width, //height: ,//width: 150,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(8),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.teal, Colors.tealAccent]),
                            ),
                            child: Image.asset(image[index])
                            //  Image(image:images222[index].image ,)
//Image.asset(image[index])
                            ),
                      ),
                    ],
                  ),
                ),

                //  )),
              );

              //Card(elevation:1,child: FlatButton(child: Column( children: [],),onPressed: (){},),);
            },
          ),
        ],
      ),
    );
//  );

Widget iteam(BannerModel ba) => Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            ba.banner,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );

Widget buynaql(String t, context, String image, home_Control _home_control) =>
    Column(
      children: [
        Row(textDirection: TextDirection.rtl, children: [
          const Icon(
            Icons.navigate_next,
            color: Colors.black26,
          ),
          Text(t, style: const TextStyle(fontSize: 16, color: Colors.black26))
        ]),
        const SizedBox(
          height: 8,
        ),
        Image.asset(image),
        const SizedBox(
          height: 13,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: u,
              decoration: InputDecoration(
                labelText: 'ReceivingLocation'.tr,
                suffixIcon: GestureDetector(
                    onTap: () {},
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
        const SizedBox(
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MapScreen();
                      }));
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
        const SizedBox(
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
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
              alignment: Alignment.topRight, child: Text('DriverNotes'.tr)),
        ),
        const SizedBox(
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
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(' ريال 200 '))),
            const SizedBox(
              width: 70,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text('ApproximatePrice'.tr)))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            _home_control.add_order(
                context,
                t,
                200.toString(),
                noteController.text.toString(),
                u.text.toString(),
                toController.text.toString(),
                newDateTimeIn.toString(),
                '55',
                '66',
                '22',
                '33');
            // showDialog(builder: (BuildContext context)  =>
            //     AlertDialog(content: Container(height: 200,
            //       child: Column(children: [
            //          Image.asset('assets/images/Group 8775.png') ,
            //         SizedBox(height: 9,),
            //         Text('تم إرسال طلبك للسائقين',style: TextStyle(fontSize: 20),),
            //
            //
            //       ],),
            //     ),), context: context ,  );
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
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );

Widget buynaql22(String t, context, String image) => Column(
      children: [
        myrow(t),
        const SizedBox(
          height: 8,
        ),
        Image.asset('image'),
        const SizedBox(
          height: 13,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: u,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ReceivingLocation'.tr,
                suffixIcon:
                    Image.asset('assets/images/Icon open-map-marker.png'),
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
        const SizedBox(
          height: 8,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: u,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'deliveryLocation'.tr,
                suffixIcon:
                    Image.asset('assets/images/Icon open-map-marker.png'),
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
        const SizedBox(
          height: 8,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: u,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ChooseADate'.tr,
                suffixIcon: Icon(
                  Icons.date_range,
                  color: Color(int.parse("0xff${hexString}")),
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
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
              alignment: Alignment.topRight, child: Text('DriverNotes'.tr)),
        ),
        const TextField(
          decoration:
              InputDecoration.collapsed(hintText: "Enter your text here"),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 7,
          maxLines: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(' ريال 200 '))),
            const SizedBox(
              width: 70,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text('ApproximatePrice'.tr)))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: u,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'SuggestAnotherPrice'.tr,
                suffixIcon: Icon(
                  Icons.date_range,
                  color: Color(int.parse("0xff${hexString}")),
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
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              builder: (BuildContext context) => AlertDialog(
                content: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Image.asset('assets/images/Group 8775'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'YourRequestHasBeenSentToDrivers'.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              context: context,
            );
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
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );

Widget bottomnavbar(cubitapi co) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: const Radius.circular(10),
            topLeft: const Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            //withOpacity(0.5),
            spreadRadius: 12,
            blurRadius: 7,
            offset: const Offset(6, 6), // changes position of shadow
          )
        ]),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.teal),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: co.currentindex,
        onTap: (index) {
          co.onchange(index);
        },
        items: co.bottomitem,
      ),
    ),
  );
}

Widget alret() => PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            height: 30,
            // ignore: deprecated_member_use
            child: Container(
              width: 130,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.close,
                      color: Color(int.parse("0xff00afa0")),
                    ),
                    const SizedBox(width: 15),
                    Text('CancellingOrder'.tr),
                  ],
                ),
                onPressed: () {
                  showDialog(
                      builder: (BuildContext context) => AlertDialog(
                            content: Container(
                                height: 220,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      'AreYouSureToCancelTheOrder'.tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.teal,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: OutlinedButton(
                                                style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(
                                                  const BorderSide(
                                                    width: 1,
                                                    color: Colors.teal,
                                                  ),
                                                )),
                                                onPressed: () {},
                                                child: Text(
                                                  'no'.tr,
                                                  style: const TextStyle(
                                                      color: Colors.teal),
                                                ))),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text('yes'.tr),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.teal),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                      context: context);
                },
              ),
            ),
            value: 1,
          ),
          PopupMenuItem(
            height: 30,
            child: Container(
              width: 130,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/Path 14038.png'),
                    const SizedBox(width: 15),
                    Text('changeTheDriver'.tr),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            value: 2,
          ),
          PopupMenuItem(
            height: 30,
            child: Container(
              width: 130,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/Icon open-map-marker.png'),
                    const SizedBox(width: 17),
                    Text('orderTracking'.tr),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => orderrace()));
                },
              ),
            ),
            value: 3,
          ),
          PopupMenuItem(
            height: 30,
            child: Container(
              width: 130,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //textDirection: TextDirection.rtl,
                  children: [
                    Icon(Icons.message_outlined,
                        color: Color(int.parse("0xff00afa0"))),
                    const SizedBox(width: 15),
                    Text('FileAComplaint'.tr),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => writeproblem()));
                },
              ),
            ),
            value: 4,
          ),
        ];
      },
    );
