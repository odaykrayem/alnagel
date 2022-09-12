import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'componant.dart';
import 'messages.dart';
import 'shared/cubit.dart';

class waitingpayment extends StatefulWidget {
  @override
  _waitingpaymentState createState() => _waitingpaymentState();
}

class _waitingpaymentState extends State<waitingpayment> {

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

    myrow('chat'.tr),
        Container( height: 60,
          width: 400,
          child: FlatButton(onPressed: () {  },color: Colors.black12,

            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                Container(alignment: Alignment.centerLeft,
                  child: alret()
                 // PopupMenuButton(itemBuilder: (BuildContext context) {return
                  //   },)
                ),
                SizedBox(width: 5,),

                Container(width:25,child: IconButton(icon:Icon(Icons.phone,color: Colors.grey,size: 15,), onPressed: () {  },)),

                SizedBox(width: 5,),

                Container(width:25,child: IconButton(icon:Icon(Icons.location_on,color: Colors.grey,size: 15,), onPressed: () {  },)),
                SizedBox(width: 5,),





                  Container(height: 25,width: 93,
                    child: FlatButton(color:Colors.indigo
                      ,child: Text('AwaitingPayment'.tr,style: TextStyle(fontSize: 10,color: Colors.white)),
                      onPressed: (){},),
                  ),
                SizedBox(width: 10,),
                Column( textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center
                    ,
                    children: [
                  Text('DriverName'.tr,style: TextStyle(fontSize: 10)),
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 8.0,
                        direction: Axis.horizontal,
                      ),

                ]),
                SizedBox(width: 10,),

               CircleAvatar(backgroundColor:Colors.indigo,radius: 16,),
                ]),

          ),
        ),


        ),
    Container(height: 430,

          child: GroupedListView<Messages,DateTime>(
            reverse: true,
  order: GroupedListOrder.DESC,
  useStickyGroupSeparators: true,
  floatingHeader: true,
  padding: const EdgeInsets.all(5),
            elements: co.m,
            groupBy: (messages) => DateTime(messages.date.year,
            messages.date.month,
            messages.date.day),
            groupHeaderBuilder: (Messages messages) => SizedBox(
              height: 40,

            ),
            itemBuilder: (context,Messages messages) =>
               Padding(
                 padding: EdgeInsets.fromLTRB(messages.issent ?  64.0 : 16.0,4, messages.issent ? 16.0:64.0,4),
                 child: Align(
                  alignment: messages.issent
                  ? Alignment.centerRight : Alignment.centerLeft,
                      child: Card(  color:  messages.issent ? Colors.teal: Colors.white,
                        elevation: 8,
                        child: Padding(padding: const EdgeInsets.all(8),
                            child: Text(messages.text,
                              style: TextStyle(color:  messages.issent ? Colors.white: Colors.grey,),),),

                      ),


              ),
               ),
            ),


),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Directionality( textDirection: TextDirection.rtl,
            child: Align( alignment: Alignment.bottomRight,
              //child: Directionality(  //textDirection: TextDirection.RTL,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Container(height: 40,width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          //withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],),

                    child: TextField( controller: co.b,
                      onSubmitted: (text){

                      },
                      //controller: coo.u ,
                      keyboardType:TextInputType.emailAddress,
                      decoration: InputDecoration(  hintText: 'writeYourMessage'.tr, hintStyle: TextStyle(fontSize: 13),
                        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container( width: 50,
                            child: Row( mainAxisAlignment:MainAxisAlignment.end,children:
                            [Icon(Icons.keyboard_voice,),Icon(Icons.photo_camera,),],),
                          ),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                      ),


                    ),

                  ),
                ),




            ),
          ),
            CircleAvatar(backgroundColor:Colors.teal,
                child:IconButton(onPressed: () {
                  setState(() {

                    final message = Messages(text: co.b.text,date: DateTime.now(),issent: true);
                  if(co.b.text.isNotEmpty ){
                    co.m.add(message);
                    co.b.clear() ;

                  }

                  });

                }, icon: IconButton(
                  onPressed:() {
                    Navigator.of(context).pop();
                  },icon:Icon(
                  Icons.arrow_forward),color: Colors.white,),

                )
            ),],),


      ])


    )))
    );
    }));
  }


}
