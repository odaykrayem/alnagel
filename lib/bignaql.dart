import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';
import 'controls/home_control.dart';

class bignaql extends StatefulWidget {
  @override
  bignaql2 createState() => bignaql2();
}

class bignaql2 extends State<bignaql> {
  home_Control _home_control = home_Control();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              cubitapi co = cubitapi.get(context);

              return Scaffold(
                //appBar: AppBar(backgroundColor:Colors.teal ,
                // ),
                body:
                // SingleChildScrollView(child:
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),


                  child:
                  SingleChildScrollView(
                    child: Container(
                        child: naql(18, 'bigTanker'.tr, 'ChooseTheRightType'.tr, t,
                            images222 ,  _home_control)

                    ),

                  ),
                ),

              );
            }
        )
    );
  }
}

  List<String> images222 = [
    "assets/images/Mask Group 16.png",
    "assets/images/Mask Group 15.png",
    "assets/images/Mask Group 18.png",
    "assets/images/Mask Group 17.png",

   "assets/images/a24d1a3f-36bd-447c-97eb-47d0d35a7539-removebg-preview.png",
   "assets/images/7f0cb56a-fd95-45ad-bc98-5be8889e6c65-removebg-preview.png",
    "assets/images/Mask Group 19.png",
   "assets/images/743x616-1_-D0Y1325oTcOxm4-removebg-preview.png",

   "assets/images/Mask Group 21.png",
    "assets/images/WhatsApp Image 2022-03-24 at 10.23.49 PM.png",
    "assets/images/4-30cbm-fresh-milk-tanker-milk-tank-truck-removebg-preview.png",
    "assets/images/Mask Group 22.png",

   "assets/images/Mask Group 25.png",
    "assets/images/Mask Group 26.png",
  "assets/images/Mask Group 24.png",
  "assets/images/Mask Group 23.png",
    "assets/images/51f6e21bac6b1-removebg-preview.png",
    "assets/images/WhatsApp_Image_2022-03-15_at_5.28.21_AM-removebg-preview.png",

  ];
  List <String > t=['TrillGermanSides'.tr,'curtainTrill'.tr,'TrailerGallab'.tr,'TrillingHighSides'.tr,'trillItsSurface'.tr,
    'waterTrill'.tr,'CarTransportTrailer'.tr,'TrailerForTransportingSheepAndLivestock'.tr,'BradTrail'.tr,'BradTrail'.tr,'waterTank'.tr,'AFuelTanker'.tr,
    'lorryTruck'.tr,'closedTruck'.tr,'DumpTruck'.tr,'flatbedTruck'.tr,'OtherBigVector'.tr,'refrigeratorTruck'.tr,];

