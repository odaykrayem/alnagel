


import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'componant.dart';
import 'messages.dart';

class writeproblem extends StatefulWidget {
  @override
  _writeproblemState createState() => _writeproblemState();
}

class _writeproblemState extends State<writeproblem> {
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
    padding: const EdgeInsets.only(top:24.0,right: 8,left: 8),
    child:SingleChildScrollView(
    child: Container(
    child: Column(children: [
    myrow('FileAComplaint'.tr),
    SizedBox(height: 30,),
      Directionality( textDirection: TextDirection.rtl,
        child: TextFormField(decoration: InputDecoration.collapsed(hintText: "WriteYourProblemDetailsHere".tr),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 5,
          maxLines: 10,
        ),
      ),
      SizedBox(height: 20,),

      Row( mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('attachments'.tr),
          SizedBox(width: 3,),

          Icon(Icons.document_scanner_outlined),

      ],),

      Container(alignment:Alignment.topRight,child: Text('YouCanUploadPhotos'.tr,style: TextStyle(color: Colors.grey),)),
      SizedBox(height: 30,),

      Row(children: [
        SizedBox(width: 10,),

        Container(  decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),),

            height:100,width: 100,child: IconButton(onPressed: () {  }, icon: Icon(Icons.add_box_outlined),),),
        SizedBox(width: 10,),

        Container(  decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),),

          height:100,width: 100,child: IconButton(onPressed: () {  }, icon: Icon(Icons.add_box_outlined),),),
        SizedBox(width: 10,),

        Container(  decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),),

          height:100,width: 100,child: IconButton(onPressed: () {  }, icon: Icon(Icons.add_box_outlined),),),
        SizedBox(width: 10,),


      ],),
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
          width: 280,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            'send'.tr,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),

      ),


    ])))));
    }));
  }
}
