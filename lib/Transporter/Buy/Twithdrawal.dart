import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../componant.dart';
import '../../payment.dart';

class Twithdrawal extends StatefulWidget {
  String? type;
  Twithdrawal(this.type);
  @override
  _TwithdrawalState createState() => _TwithdrawalState();
}

class _TwithdrawalState extends State<Twithdrawal> {
  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      
                backgroundColor: Colors.teal,
                body:
                  SingleChildScrollView(
                    child: Column(
                      children: [
                       

                       Container(
                        height: hi,
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, icon: Icon(Icons.arrow_back , color: Colors.teal,)),
                                    Text('الاعدادات' , style: TextStyle(color: Colors.teal),)
                                  ],
                                ),
                              ],
                            ),


                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('محفظتي' , style: TextStyle(color: Colors.teal , fontSize: 17),),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(widget.type!,style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold)),
                            TextButton(onPressed: (){
                              bottomSh(context);
                            }, child: Text('+ اضافة بطاقة' , style: TextStyle(color: Colors.teal ,  fontWeight: FontWeight.bold),))
                          ],),


      SizedBox(height: 10,),


                          Container(width:350,height:40,child: OutlinedButton( style:ButtonStyle(side: MaterialStateProperty.all(BorderSide( width: 1,
        color: Colors.black,),),),onPressed: (){}, child: Text('نقدا',style: TextStyle(color: Colors.black ,  fontWeight: FontWeight.bold)))),

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
                          ],
                        ),
                        ),



                       

                    ],)
                    ),



                // bottomNavigationBar: bottomnavbar(co)

              );
}

  Future<dynamic> bottomSh(BuildContext context) {
    return showModalBottomSheet(
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
  }
}