import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';
import 'controls/home_control.dart';

class servicessofsmallnaql extends StatefulWidget {
  @override
  servicessofsmallnaql2 createState() => servicessofsmallnaql2();
}

class servicessofsmallnaql2 extends State<servicessofsmallnaql> {
  home_Control _home_control = home_Control();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
        child: BlocConsumer<cubitapi, statesapi>(
            listener: (context, state) {},
            builder: (context, state) {
              cubitapi co = cubitapi.get(context);

              return Scaffold(

                body:
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 8, right: 8),
                  child:
                  SingleChildScrollView(
                    child: Container(
                        child:Column(children: [
  SizedBox(height: 8,),
  Image.asset('image'),
  SizedBox(height: 13,),
  Directionality(  textDirection: TextDirection.rtl,
    child: TextFormField(

        controller: u ,
        keyboardType: TextInputType.number,
        decoration: InputDecoration( labelText: 'ReceivingLocation'.tr,
          suffixIcon: Image.asset('assets/images/Icon open-map-marker.png'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        ),
        validator: (value){if(value!.isEmpty){return'empty';}

        return null;}),
  ),
  SizedBox(height: 8,),
  Directionality(  textDirection: TextDirection.rtl,
    child: TextFormField(
        controller: u ,
        keyboardType: TextInputType.number,
        decoration: InputDecoration( labelText: 'deliveryLocation'.tr,
          suffixIcon: Image.asset('assets/images/Icon open-map-marker.png'),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        ),
        validator: (value){if(value!.isEmpty){return'empty';}

        return null;}),
  ),
  SizedBox(height: 8,),
  Directionality(  textDirection: TextDirection.rtl,
    child: TextFormField(
        controller: u ,
        keyboardType: TextInputType.number,
        decoration: InputDecoration( labelText: 'ChooseADate'.tr,
          suffixIcon: Icon(Icons.date_range,
            color:Color(int.parse("0xff${hexString}")),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        ),
        validator: (value){if(value!.isEmpty){return'empty';}

        return null;}),
  ),
  SizedBox(height: 8,),
  Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(alignment:Alignment.topRight,child: Text('DriverNotes'.tr)),
  ),
  TextField(decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    minLines: 7,
    maxLines: 10,
  ),
  Row(children: [Expanded(child: Container(alignment:Alignment.topLeft,child: Text(' ريال 200 '))),SizedBox(width: 70,),
    Expanded(child: Container(alignment:Alignment.topRight,
        child: Text('ApproximatePrice'.tr)))],),
  SizedBox(height: 10,),
  Directionality(  textDirection: TextDirection.rtl,
    child: TextFormField(
        controller: u ,
        keyboardType: TextInputType.number,
        decoration: InputDecoration( labelText: 'SuggestAnotherPrice'.tr,
          suffixIcon: Icon(Icons.date_range,
            color:Color(int.parse("0xff${hexString}")),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        ),
        validator: (value){if(value!.isEmpty){return'empty';}

        return null;}),
  ),
  SizedBox(height: 10,),

  ElevatedButton(

    onPressed: () {
      showDialog(builder: (BuildContext context)  =>
          AlertDialog(content: Container(height: 150,
            child: Column(children: [
              Image.asset('assets/images/Group 8775') ,
              SizedBox(height: 5,),
              Text('YourRequestHasBeenSentToDrivers'.tr,style: TextStyle(fontSize: 20),),


            ],),
          ),), context: context ,  );
    },
    style: ElevatedButton.styleFrom(primary:Color(int.parse("0xff${hexString}")),

        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))),

    child: Container(decoration: BoxDecoration(color: Colors.black26,
      borderRadius: BorderRadius.circular(10),),
      width: 300,
      height: 40,
      alignment: Alignment.center,
      child: Text(
        'send'.tr,
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      ),
    ),

  ),

],)
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
  "assets/images/image1-removebg-preview.png",
"assets/images/4-HP.009-405x330-removebg-preview.png",

"assets/images/Mask Group 4.png",
 "assets/images/52240-removebg-preview.png",

];
List <String > t=['WholesaleMerchandiseDelivery'.tr,'FlowerDeliveryAndArrangement'.tr,'MiscellaneousOther'.tr,'SweetsDelivery'.tr];

