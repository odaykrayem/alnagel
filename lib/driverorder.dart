import 'package:alnagel/componant.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class driverorder extends StatefulWidget {
  @override
  _driverorderState createState() => _driverorderState();
}

class _driverorderState extends State<driverorder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.only(top:20.0,right: 10,left: 10),
    child: Container(
    child: Column(children: [

      myrow('back'.tr),
      SizedBox(height: 60,),
      CircleAvatar(radius: 30,),
      SizedBox(height: 12,),

      Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Row(textDirection:TextDirection.rtl,children: [SizedBox(width: 5),
          Text('YourRequestHasBeenSentToDrivers'.tr,style: TextStyle(color: Colors.grey,fontSize: 17),),
          Text('محمد السيد',style: TextStyle(fontSize: 17)),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.only(left:80),
        child: Row(textDirection:TextDirection.ltr,children:[Text('money',style: TextStyle(color: Colors.grey,fontSize: 12)),
          Icon(Icons.attach_money_rounded,color: Colors.grey,size: 12,),
          SizedBox(width: 30,),
          Text('type',style: TextStyle(color: Colors.grey,fontSize: 12)),
          Icon(Icons.work_outline_rounded,color: Colors.grey,size: 12),
          SizedBox(width: 30,),
          Text('time',style: TextStyle(color: Colors.grey,fontSize: 12)),
          Icon(Icons.access_time,color: Colors.grey,size: 12),]),
      ),
      SizedBox(height: 7,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(child: OutlinedButton(onPressed: (){},style:
      ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.red,),)), child: Text('OtherOffers'.tr,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))),
          SizedBox(width: 15,),
          Expanded(
            child: ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.green),onPressed: (){
              showDialog(builder: (BuildContext context)  =>
                  AlertDialog(content: Container(height: 230,
                    child: Column(children: [
                      SizedBox(width: 10,),

                      Text('DearCustomer'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      SizedBox(height: 20,),
                      Text('YouCannotCancelTheOrderOrReplaceTheRepresentativeAfter7MinutesFromNow'.tr,textAlign: TextAlign.right,style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                      Row(children: [
                        Expanded(child: OutlinedButton(style:
                        ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
                          color: Colors.teal,),)),onPressed: (){}, child: Text('Cancellation'.tr,style: TextStyle(color: Colors.teal),))),
                        SizedBox(width: 5,),

                        Expanded(child:ElevatedButton(onPressed: (){}, child: Text('OK'.tr),
                          style:ElevatedButton.styleFrom(primary: Colors.teal) ,),),

                      ],)


                    ],),
                  ),), context: context ,  );

            }, child: Text('قبول',style: TextStyle(fontWeight: FontWeight.bold),)),
          )],),
      ),
      SizedBox(height: 2,),
       Container(width: 320,
         child: OutlinedButton(onPressed: (){
            showDialog(builder: (BuildContext context)  =>
                AlertDialog(content: Container(height: 250,
                  child: Column(children: [
                    SizedBox(height: 15,),

                    Text('SuggestedPrice'.tr,style: TextStyle(color: Colors.grey,fontSize: 15),),
                    SizedBox(height: 1,),
                    Row(           
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Text(' ريال',style: TextStyle(color: Colors.black,fontSize: 15)),
                      Text(' 100',style: TextStyle(color: Colors.black,fontSize: 15)),


                    ],),
                    SizedBox(height: 17,),
                     Container(height: 1,width: 200,color: Colors.grey,),
                    SizedBox(height: 17,),
                    Text('adjustThePrice'.tr,style: TextStyle(color: Colors.grey,fontSize: 15)),
                    SizedBox(height: 3,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic, //if it not writed will be take error , it is required
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                       Text('ريال'),
                     ),
                      SizedBox(width: 7,),
                     Container(width: 40, child: TextFormField(cursorColor: Colors.black,
                       keyboardType:TextInputType.phone,
                         validator: (value){if(value!.isEmpty){return'empty';}

                         return null;}
                     )),
                   ],) ,
                    SizedBox(height: 9,),

                      //Expanded(child:
                      ElevatedButton(  style:ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: (){
                        showDialog(builder: (BuildContext context)  =>
                            AlertDialog(content: Container(height: 250,
                              child: Column(children: [
                                SizedBox(height: 20,),

                                Text('YourPriceHasBeenAccepted'.tr,style: TextStyle(color: Colors.black,fontSize: 20),),
                                SizedBox(height: 9,),
                                Icon(Icons.done,color: Colors.green,size: 50,),
                                Text('GoToThePaymentStep'.tr,style: TextStyle(color: Colors.grey),),
                                SizedBox(height: 9,),

                                ElevatedButton(   onPressed: (){


                                },
                                  style: ElevatedButton.styleFrom(primary: Colors.black54,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),

                                  child: Container(decoration: BoxDecoration(color: Colors.teal,
                                    borderRadius: BorderRadius.circular(10),),
                                    width: 200,
                                    height: 40,
                                    alignment: Alignment.center,
                                child: Text('paying'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),




                              ],),
                            ),), context: context ,  );


                      }, child: Container(
                                         alignment: Alignment.center,
                            width:150,child: Text('send'.tr,style: TextStyle(color: Colors.white),)),),
                      //),




                  ],),
                ),), context: context ,  );


          }, child: Text('SuggestAnotherPrice'.tr,style: TextStyle(color: Colors.grey),)),
       ),

      SizedBox(height: 14,),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(alignment:Alignment.topRight,child: Text('MyOrderDetails'.tr,style: TextStyle(color: Colors.teal),)),
      ),
      Container(height:50,width: 400,child: Card(
       child: Row(
         //crossAxisAlignment:CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
         children: [IconButton(icon: Icon(Icons.edit,size: 15,),onPressed: (){},),SizedBox(width: 30,),

         Text('شارع عثمان بن عفان , الروضة',style: TextStyle(color: Colors.grey),),
           Text('ReceivingLocation'.tr),
         Icon(Icons.location_on,color: Colors.grey,)],)

      )),
      SizedBox(height: 10),

      Container(height:50,width: 400,child: Card(
          child: Row(
            //crossAxisAlignment:CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,

            children: [IconButton(icon: Icon(Icons.edit,size: 15,),onPressed: (){},),SizedBox(width: 40,),

            Text('شارع الامير سلطان , جده',style: TextStyle(color: Colors.grey),),
              Text('deliveryLocation'.tr),

            Icon(Icons.location_on,color: Colors.grey,)],)

      )),
      SizedBox(height: 10),

      Container(
          //height:80,
          width: 400,child: Card(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
           child:
           Column(children: [
              Row(
                //crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,

                children: [IconButton(icon: Icon(Icons.edit,size: 15,),onPressed: (){},),SizedBox(width: 170,),
                  Text('DriverNotes'.tr),


                ],),
            // SizedBox(height: 15,),
             Container(alignment: Alignment.topRight,
                 child: Text('NewApplicationPayAttentionToTheLocationOfDeliveryAndReceivingNewApplicationPayAttentionToTheSiteOfDeliveryAndReceiptNewApplicationPayAttentionToTheSiteOfDeliveryAndReceipt'.tr,
                   textAlign:TextAlign.right,style: TextStyle(color: Colors.grey),))
             ],)

          )

      )),

      SizedBox(height: 50,)
    ])))
    ),);

    })
    );

    }
}
