import 'package:alnagel/controls/home_control.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';

class midumnaql extends StatefulWidget {
  @override
  midumnaql2 createState() => midumnaql2();
}

class midumnaql2 extends State<midumnaql> {
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
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 8, right: 8),


                    child:
                    SingleChildScrollView(
                      child: Container(
                          child: naql(12, 'mediumTanker'.tr,
                              'ChooseTheRightType'.tr, t, images222 , _home_control)

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
    "assets/images/WhatsApp_Image_2022-03-15_at_5.41.29_AM-removebg-preview.png",
   "assets/images/نقل_عفش_العالمية-removebg-preview.png",

   "assets/images/Mask Group 11.png",
    "assets/images/243003073968.png",
    "assets/images/Mask Group 13.png",
    "assets/images/Mask Group 12.png",
   "assets/images/WhatsApp_Image_2022-03-22_at_2.07.17_PM-removebg-preview.png",
  "assets/images/Mask Group 14.png",
   "assets/images/Screenshot_2022-03-22_071614-removebg-preview.png",
   "assets/images/816x612-1_-s1Z6gfD5Wkj6zM-removebg-preview.png",
    "assets/images/mobile_listing_main_1-removebg-preview.png",

   "assets/images/نقلاتبترول-الامارات-removebg-preview.png",

  ];
  List <String > t=['دينا براد','دينا مغلقة','دينا سطحة هيدروليك','دينا سطحة عادية ','دينا جوانب منخفضة','دينا قلاب ','دينا نقل مواشي و أغنام','دينا جوانب مرتفعة',
    'دينا تنكر ماء','دينا ونش للإبل','نقلات متوسطة أخرى ','دينا تنكر محروقات',];

