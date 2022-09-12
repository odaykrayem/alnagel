import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'componant.dart';
import 'messages.dart';


class calldriver extends StatefulWidget {
  @override
  _calldriverState createState() => _calldriverState();
}

class _calldriverState extends State<calldriver> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(body:
    //SingleChildScrollView(
    //child:
    Padding(
    padding: const EdgeInsets.only(top: 24.0,right: 10,left: 10),
    child: SingleChildScrollView(
    child: Container(
    child: Column(children: [
    myrow('back'.tr),
    SizedBox(height: 60,),
    Container(height: 400,width: 300,
      child: Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [

        CircleAvatar(radius: 40,),
        SizedBox(height: 20,),

        Text('name'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        SizedBox(height: 10,),

        Text('number'.tr,style: TextStyle(color:Colors.grey,fontSize: 20),),
        SizedBox(height: 30,),
        ElevatedButton(

          onPressed: () {

          },
          style: ElevatedButton.styleFrom(primary: Colors.black54,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),

          child: Container(decoration: BoxDecoration(color: Colors.teal,
            borderRadius: BorderRadius.circular(10),),
            width: 150,
            height: 40,
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Text(
                  'ContactTheDriver'.tr,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10,),
                Icon(Icons.phone_android,color: Colors.white,)

              ],),
            )

          ),

        ),


      ]

      ))),
    )])))),
      );
    }));
  }
}
