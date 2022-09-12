import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';

class mymoney extends StatefulWidget {
  @override
  _mymoneyState createState() => _mymoneyState();
}

class _mymoneyState extends State<mymoney> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.only(top:20.0,right: 6,left: 6),
    child: Container(
    child: Column(children: [

    myrow('myBalance'.tr),
    SizedBox(height: 50,),
      Row( crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ريال',style: TextStyle(color: Colors.grey,fontSize: 16),),
          SizedBox(width: 3,),
          Text('135',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),



        ],),
      SizedBox(height: 70,),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(alignment:Alignment.topRight,child: Text('AddCreditVia'.tr,style: TextStyle(color: Colors.grey),)),
      ),
      SizedBox(height: 10,),

      Container(width:350,height:40,child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),onPressed: (){}, child: Image.asset('assets/images/NoPath - Copy.png'))),
      SizedBox(height: 10,),

      Container(width:350,height:40,child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),onPressed: (){}, child: Image.asset('assets/images/stc-pay-logo-1B4E546749-seeklogo.com.png'))),
      SizedBox(height: 10,),

      Container(width:350,height:40,child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),onPressed: (){}, child: Image.asset('assets/images/Mask Group 2.png'))),
      SizedBox(height: 10,),

      Container(width:350,height:40,child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),onPressed: (){}, child: Image.asset('assets/images/2560px-Apple_Pay_logo.svg (1).png'))),
      SizedBox(height: 10,),

    ])))));
    }));

  }
}
