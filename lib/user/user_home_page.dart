import 'package:alnagel/bignaql.dart';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/user_banners_controller.dart';
import 'package:alnagel/controls/home_control.dart';
import 'package:alnagel/midumnaql.dart';
import 'package:alnagel/models/banner_model.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/smallnaql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../componant.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _homepagescreenState createState() => _homepagescreenState();
}

class _homepagescreenState extends State<UserHomePage> {
  home_Control home_control = home_Control();
  List<BannerModel>? LBanner = [];
  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    String apiToken = Get.find<AppController>().getApiToken()!;
    debugPrint('userHome Token: $apiToken');
    Get.find<UserBannerController>().getBanners({});
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  String hexString = "00afa0";
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(create: (BuildContext context) => cubitapi(),
    //     child: BlocConsumer<cubitapi, statesapi>(
    //         listener: (context, state) {},
    //         builder: (context, state) {
    //           cubitapi co = cubitapi.get(context);

    return Scaffold(
      //appBar: AppBar(backgroundColor:Colors.teal ,
      // ),
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(2),
                    topLeft: Radius.circular(2))),
            child: Container(
                decoration: BoxDecoration(
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
          SizedBox(
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
                    offset: Offset(0, 3), // changes position of shadow
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
                      borderSide: BorderSide(color: Colors.white70)),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 100,
              width: 500,
              child:
                  GetBuilder<UserBannerController>(builder: (bannerController) {
                return bannerController.isLoaded
                    ? ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: bannerController.bannersList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            iteam(bannerController.bannersList[index]),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 9,
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff00afa0),
                        ),
                      );
              }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => bignaql()));
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.teal,
                    alignment: Alignment.center,
                    primary: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/mercedes-truck-2.png'),
                    Text(
                      'LargeTankertrucksAndTrailers'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => midumnaql(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    alignment: Alignment.center,
                    primary: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/243003073968.png'),
                    Text(
                      'MediumTankerDyna'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => smallnaql(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    alignment: Alignment.center,
                    primary: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/_119244502_whatsubject.png'),
                    Text(
                      'SmallCarrierParcelsAndServices'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ))),

      // bottomNavigationBar: bottomnavbar(co)
    );
  }
  //   )
  //   );
//  }
}

Widget bottomnavbar(cubitapi co) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            //withOpacity(0.5),
            spreadRadius: 12,
            blurRadius: 7,
            offset: Offset(6, 6), // changes position of shadow
          )
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.teal),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
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
