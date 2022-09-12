import 'package:alnagel/join_as_screen.dart';
import 'package:alnagel/Transporter/transporter_main.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/user/user_main_page.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logale/locale_Cont.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  ChooseLanguageScreenState createState() => ChooseLanguageScreenState();
}

class ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  MyLocaleController controller = Get.find<MyLocaleController>();
  AppController appController = Get.find<AppController>();
  int? _radioSelected;

  int _currentTimeValue = 1;

  int n = 0;
  late int mykey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/1.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
              width: 230,
              height: 400,
              child: Column(
                children: [
                  Image.asset('assets/images/n.png'),
                  //SizedBox(height: 200,),Container(alignment: Alignment.bottomCenter, height:60,width: 100, color: Colors.cyan,)
                ],
              )),
        ]),
        bottomSheet: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  //withOpacity(0.5),
                  spreadRadius: 12,
                  blurRadius: 7,
                  offset: const Offset(6, 6), // changes position of shadow
                )
              ],
            ),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                    alignment: Alignment.topRight,
                    child: const Text(
                      'اختيار اللغة',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10),
                child: Container(
                  height: 200,
                  width: 400,
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Container(
                        height: 200,
                        child: Column(children: [
                          br(t, im, index, lang[index]),
                          const SizedBox(
                            height: 5,
                          ),
                          radio(index)
                        ])),
                    //br(t,im,index),
                    // radio(index),
                    //  br(t,im,index),

                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 4,
                      );
                    },
                  ),
                ),
              ),
            ])));
  }

  Widget br(List<String> list, List<Image> image, int i, String la) {
    return
        //onPressed: () { mykey=i; },
        // child:
        Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FlatButton(
        onPressed: () async {
          mykey = i;
          var prefs = await SharedPreferences.getInstance();
          setState(() {
            _radioSelected = mykey as int?;
            appController.savelanguageCode(la);
            controller.changeLang(la);
            if (appController.getApiToken() == null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JoinAsScreen()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => appController.getUserType() ==
                              AppConstants.USER_TYPE_USER
                          ? UserMainPage()
                          : TransporterMainPage()));
            }
          });
        },
        child: Column(children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            list[i],
            style: const TextStyle(fontSize: 10),
          ),
          const SizedBox(
            height: 8,
          ),
          Image(image: im[i].image)
        ]),
      ),
    );
  }

  Widget radio(int i) {
    return Radio(
        value: i, //br(t, im, i),
        groupValue: _radioSelected, //toggleable: true,
        onChanged: (v) {
          setState(() {
            _radioSelected = mykey;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const JoinAsScreen()));
        });
  }
  // );
}

List<Image> im = [
  Image.asset("assets/images/Flag_of_Pakistan.svg.png"),
  Image.asset("assets/images/bangladesh.png"),
  Image.asset("assets/images/jai-hind-500x500.png"),
  Image.asset("assets/images/yy.png"),
  Image.asset("assets/images/Saudi-Arabia.png"),
];

List lang = ['urd', 'BD', 'hi', 'en', 'ar'];

List<String> t = [
  'أوردو',
  'بنغلادش',
  'هندي',
  'EN',
  'عربي',
];
