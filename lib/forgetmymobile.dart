import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'confirmmobilephone.dart';

class forgetmymobile extends StatefulWidget {
  @override
  forgetmymobile2 createState() => forgetmymobile2();
}

class forgetmymobile2 extends State<forgetmymobile> {
  final   TextEditingController u =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      //appBar: AppBar(backgroundColor:Colors.teal ,
      // ),
        body:
        // SingleChildScrollView(child:
        Container(color: Colors.teal,

            child:
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [  IconButton(
                      onPressed:() {
                        Navigator.of(context).pop();
                      },icon: Icon(
                      Icons.arrow_forward),color: Colors.white,),
                      SizedBox(width: 10,),

                  Text('IForgotTheSecretNumber'.tr,style: TextStyle(color: Colors.white,fontSize: 15),),


                    ],),
                ),
                SizedBox(height: 10,),

                Center(

                  child: Container( width: 330,
                      decoration: const BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20) ,
                              bottomRight:  Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 26, top: 15,bottom: 150),


                          child: Column(children: [  SizedBox(height: 10,),

                            Container(height:250,alignment: Alignment.center,child:Image.asset('assets/images/Screenshot 2022-01-07 081312.png') ),
                            SizedBox(height: 2,),
                            Text('PleaseEnterYourMobileNumberTo'.tr),
                           // Text('${n}'),

                            SizedBox(height: 10,),

                            Directionality(  textDirection: TextDirection.rtl,
                              child: TextFormField(
                                controller: u ,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration( labelText: 'MobileNumber'.tr,
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                                  ),
                                  validator: (value){if(value!.isEmpty){return'empty';}

                                  return null;}),
                            ),
                            SizedBox(height: 10,),



                            ElevatedButton(

                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  confirmmobile(sentt: u.text,),));
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.black54,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),

                              child: Container(decoration: BoxDecoration(color: Colors.black26,
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

                            SizedBox(width: 20,),







                          ],)


                      )
                  ),
                ),
                SizedBox(height: 20,),
              ]),

            )
        ));


  }
}
