       import 'package:alnagel/componant.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class payment extends StatefulWidget {
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
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
      myrow('paying'.tr),
      SizedBox(height: 30,),
      Row( crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('ريال',style: TextStyle(color: Colors.grey,fontSize: 16),),
          SizedBox(width: 3,),
          Text('200',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),



        ],),
      
      SizedBox(height: 60,),

      Directionality(  textDirection: TextDirection.rtl,
        child: TextFormField( decoration: InputDecoration( labelText: 'addCoupon'.tr,
          suffixIcon: IconButton(icon: Image.asset('assets/images/Group 8871.png'),onPressed: (){},),
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
         ),),
       ),
      
      SizedBox(height: 40,),
      Row( textDirection:TextDirection.rtl,children: [
        Text('PaymentMethod'.tr,style: TextStyle(color: Colors.grey),),
        SizedBox(width: 170,),
        TextButton(onPressed: (){
    showModalBottomSheet(
    isScrollControlled: true, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
    ),
    context: context, builder: (context){
    return Container(height: 500,
      child: StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
      return  Padding(
      padding: const EdgeInsets.all(10.0),

      child: Center(

      child: Column(
        children: [
        Container(alignment:Alignment.topRight,
      child: IconButton(icon:Icon(Icons.close,), onPressed:(){
        Navigator.of(context).pop();
      })),
         Container(alignment:Alignment.topLeft,
             child: Text('AddACreditDebitCard'.tr)),
        SizedBox(height: 10,),

        Container(height: 1,width: 340,color: Colors.black12,),
        SizedBox(height: 15,),
        Directionality(  textDirection: TextDirection.rtl,

            child:
            TextFormField(decoration: InputDecoration( labelText: 'cardNumber'.tr, filled: true,fillColor:  Colors.black12,
                hoverColor:  Colors.black12, focusColor:  Colors.black12,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black12)
                  //borderSide: BorderSide(color: Colors.black12)
                ),
            ),),
        //  ),
        ),
        SizedBox(height: 10,),

        Row(children: [
          Container(width: 100,
            decoration: BoxDecoration(//borderRadius: BorderRadius.circular(10.0),
            color: Colors.black12,
          ) ,
            child: Directionality(  textDirection: TextDirection.rtl,
              child: TextFormField(decoration: InputDecoration( labelText: '  cvv', fillColor: Colors.white70,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.black12)),
              ),),
            ),
          ),
          SizedBox(width: 3,),
          Expanded(
            child: Container(
              //width:220,
              decoration: BoxDecoration(//borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12,
            ) ,
              child: Directionality(  textDirection: TextDirection.rtl,
                child: TextFormField(decoration: InputDecoration( labelText: 'ExpiryDateMonthYear'.tr, fillColor: Colors.white70,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.black12)),
                ),),
              ),
            ),
          ),
        ],),
        SizedBox(height: 10,),

        Directionality(  textDirection: TextDirection.rtl,
          child: Container(//decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
            color: Colors.black12,
          //) ,
            child: TextFormField(decoration: InputDecoration( labelText: 'FirstName'.tr, fillColor: Colors.white70,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.black12)),
            ),),
          ),
        ),
        SizedBox(height: 10,),

       // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
         // color: Colors.black12,
        //) ,
         // child:
          Directionality(  textDirection: TextDirection.rtl,
            child: TextFormField(decoration: InputDecoration( labelText: 'lastName'.tr, fillColor: Colors.black12,filled: true,
              hoverColor:  Colors.black12, focusColor:  Colors.black12,

              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.black12)),
            ),),
          ),
   //   ),
        SizedBox(height: 10,),

        ElevatedButton(   onPressed: (){

          showDialog(builder: (BuildContext context)  =>
              AlertDialog(content: Container(height: 220,
                child:Column(
                  children: [
                  SizedBox(height: 10,),
                  Text('ourEnd'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Image.asset('assets/images/Group 8766.png'),
                  SizedBox(height: 10,),
                    Text('PaymentConfirmedSuccessfully'.tr)

                ],)
              ),), context: context ,  );






        },
          style: ElevatedButton.styleFrom(primary: Colors.black54,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),

          child: Container(decoration: BoxDecoration(color: Colors.teal,
            borderRadius: BorderRadius.circular(10),),
            width: 300,
            height: 40,
            alignment: Alignment.center,
            child: Text('SaveTheCard'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
               SizedBox(height: 30,)
      ],
      ))
      );}),
    );});


        },
            child: Text('addCard'.tr,style: TextStyle(color: Colors.teal),)),
      ],),
      Container(width:350,height:40,child: OutlinedButton(  style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),
          onPressed: (){}, child: Text('cash'.tr,
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))),
      SizedBox(height: 10,),

      Container(width:350,height:40,
        child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
          color: Colors.black,),),),onPressed: (){}, child:Row(   mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/Group 8824.png'),
          SizedBox(width: 6,),
          Text('myBalance'.tr,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),

        ],) ),
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

      ElevatedButton(   onPressed: (){
showDialog(builder: (BuildContext context)  =>
          AlertDialog(
            content:
            Container(height: 200,
            child: Column(children: [
              Image.asset('assets/images/Group 8775.png') ,
              SizedBox(height: 9,),
              Text('YourRequestHasBeenSentToDrivers'.tr,style: TextStyle(fontSize: 20),),


            ],),
          ),), context: context ,  );

      },
        style: ElevatedButton.styleFrom(primary: Colors.black54,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),

        child: Container(decoration: BoxDecoration(color: Colors.teal,
          borderRadius: BorderRadius.circular(10),),
          width: 300,
          height: 40,
          alignment: Alignment.center,
          child: Text('Confirmation'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
      SizedBox(height: 40,)


      
      
    ])))));}));
  }
}
