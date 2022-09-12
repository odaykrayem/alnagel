import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'componant.dart';

class shareapp extends StatefulWidget {
  @override
  _shareappState createState() => _shareappState();
}

class _shareappState extends State<shareapp> {
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

    myrow('ShareTheApp'.tr),
    SizedBox(height: 100,),
      Container(width: 270,
        child: Card(child: Column(children: [
          Image.asset('assets/images/Group 8657.png'),
          SizedBox(height: 30,),

          Row(children: [
            SizedBox(width: 10,),

            IconButton(onPressed: (){}, icon:Icon(FontAwesomeIcons.whatsapp,color: Colors.green,) ),
            SizedBox(width: 5,),

            IconButton(onPressed: (){}, icon:Icon(FontAwesomeIcons.snapchat,color: Colors.yellow,) ),
            SizedBox(width: 5,),

            IconButton(onPressed: (){}, icon:Icon(FontAwesomeIcons.twitter,color: Colors.blue,) ),
            IconButton(onPressed: (){}, icon: PopupMenuButton(itemBuilder: (context) => [
              PopupMenuItem(height:30,
                child: Container(height: 20,width: 60,
                    alignment:Alignment.topRight,
                ),value: 1,),

              PopupMenuItem(height:30,

                child: Container(height: 20,width: 60,
                  alignment:Alignment.topRight,),
                value: 2,),



            ]), ),

          ],),
          SizedBox(height: 10,)
        ],),),
      ),


    ])))));
    }));
  }
}
