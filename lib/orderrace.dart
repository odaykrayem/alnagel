import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'componant.dart';
import 'messages.dart';

class orderrace extends StatefulWidget {
  @override
  _orderraceState createState() => _orderraceState();
}

class _orderraceState extends State<orderrace> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.only(top:22.0,right: 6,left: 6),
    child: Container(
    child: Column(children: [

    myrow('orderTracking'.tr),
    Container(height: 400,width: 400,color: Colors.grey,),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container( color: Colors.white,

          child:Column(children: [
            Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Column(children: [
                RatingBarIndicator(
            rating: 2.75,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 8.0,
            direction: Axis.horizontal,
          ),
             Text('OrderNumber'.tr,style: TextStyle(color: Colors.grey),),
              ],),
              SizedBox(width: 150,),
              Column(children: [            Text('DriverName'.tr,style: TextStyle(fontSize: 15),),
                Text('conveyorType'.tr,style: TextStyle(color: Colors.grey),),
              ],),
                SizedBox(width: 6,),

                CircleAvatar(),

            ],),
            SizedBox(height: 10,),
            Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text('35 دقيقة ',style: TextStyle(color: Colors.grey),),
              Text('ApproximateArrivalTime'.tr,style: TextStyle(),),
              SizedBox(width: 80,),
              Text('كم9',style: TextStyle(color: Colors.grey),),
              Text('distance'.tr,style: TextStyle(),),


            ],)


          ],)




        ),
      )

    ]
    )))),);
    }));
  }
}
