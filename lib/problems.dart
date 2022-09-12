   import 'package:alnagel/controls/sendMass.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';

class problems extends StatefulWidget {

  @override
  _problemsState createState() => _problemsState();
}

class _problemsState extends State<problems> {

Message_control _message_control = Message_control();

TextEditingController nameController = TextEditingController();
TextEditingController proController = TextEditingController();

  String hexString = "00afa0";

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

    myrow('ComplaintsAndSuggestions'.tr),
      SizedBox(height: 30,),
      Directionality(  textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: nameController ,
            keyboardType:TextInputType.emailAddress,
            decoration: InputDecoration( labelText: 'mail'.tr,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
            ),
            validator: (value){if(value!.isEmpty){return'empty';}

            return null;}),
      ),
      SizedBox(height: 10,),
      Directionality(  textDirection: TextDirection.rtl,
        child:   TextFormField(
          controller: proController,
          decoration: InputDecoration(
            hintText: "WriteYourComplaintOrSuggestions".tr,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),),

          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 13,
          maxLines: 22,
        ),

      ),
      SizedBox(height: 20,),
      Container(width: 260,
        child: OutlinedButton( style: ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
          color:Color(int.parse("0xff${hexString}")),),),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
        ),
          onPressed: (){
            _message_control.sendmassage(nameController.text , proController.text , context);
          }, child: Text('send'.tr,style: TextStyle(color:Color(int.parse("0xff${hexString}")),),),),
      )
    ])))));
    }));
  }
}
