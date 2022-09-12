import 'package:alnagel/servicessmallnaql.dart';
import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';
import 'naqlbuyinformation.dart';

class smallnaql extends StatefulWidget {
  @override
  smallnaql2 createState() => smallnaql2();
}

class smallnaql2 extends State<smallnaql> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(
    //appBar: AppBar(backgroundColor:Colors.teal ,
    // ),
    body:
    // SingleChildScrollView(child:

    Padding(
    padding: const EdgeInsets.only(top: 40.0,left: 8,right: 8),

    child: SingleChildScrollView(


    child: Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),

          child: Row(
            textDirection: TextDirection.rtl,
            children: [  IconButton(
              onPressed:() {
                Navigator.of(context).pop();
              },icon: Icon(
              Icons.navigate_next),color: Colors.grey,),

              Text('t',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey))

              ,



            ],),

        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.only(right: 17.0),
          child: Container(alignment:Alignment.topRight,
              child: Text('ChooseTheRightType'.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),)),
        ),
        // SizedBox(height: 10,),
        GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: t.length,shrinkWrap:true,
          physics: ScrollPhysics(),

          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.only(right:8,left: 8,bottom: 8),
              child:
              //OutlinedButton(
              //onPressed: () {  },style:
              //ButtonStyle(side: MaterialStateProperty.all(BorderSide( width:2 ,
              //color: Colors.teal,),),
              //shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              //),



              //    child:
              Container( height: 220,width: 200,
                decoration:  BoxDecoration( gradient: LinearGradient(  begin: Alignment.topCenter,
                    end:
                    Alignment.bottomCenter,
                    colors: [Colors.white,Colors.cyanAccent]),
                  border: Border.all(
                      color:Color(int.parse("0xff${hexString}")),
                      width: 1),

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10) ,
                      topRight:Radius.circular(10),topLeft: Radius.circular(10) ),),
                child: Column(

                  children: [

                    //  ),
                    ElevatedButton(
                      onPressed: () {if( index==2){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  servicessofsmallnaql()
                        ));

                      }
                      else
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  naqlbuyinfo(tt: t[index],
                                imagee:images222[index],  )));
                      },
                      style: ElevatedButton.styleFrom( shadowColor: Colors.grey,alignment:
                      Alignment.center,
                          primary: Colors.white,
                          fixedSize: Size(200, 40),

                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(10),
                                topLeft:Radius.circular(10),
                                bottomRight:Radius.circular(5),bottomLeft:Radius.circular(5),))),

                      child: Text(
                        t[index],
                        style: TextStyle(color: Color(int.parse("0xff${hexString}")),
                            fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),


                    //SizedBox(height: 10,),
                    Expanded(
                      child: Container(  width: MediaQuery.of(context).size.width,//height: ,//width: 150,
                          decoration: const BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),bottomRight: Radius.circular(8),),

                            gradient: LinearGradient(  begin: Alignment.bottomCenter,
                                end:
                                Alignment.topCenter,
                                colors: [Colors.teal,Colors.tealAccent]),),
                          child:Image.asset(images222[index])
                        //  Image(image:images222[index].image ,)
//Image.asset(image[index])
                      ),
                    ),

                  ],),
              ),


              //  )),
            );


            //Card(elevation:1,child: FlatButton(child: Column( children: [],),onPressed: (){},),);
          },),


      ],

      ),
    )
    //Container(child: naql(5,'ناقلات صغيرة ','إختر النوع المناسب',t,images222))

    ),

    ),
    );
    }
    )
    );
  }
  List<String> images222 = [
   "assets/images/WhatsApp_Image_2022-03-15_at_6.37.07_AM-removebg-preview (1).png",
  "assets/images/800px-2018_Ford_Transit_Custom_300_Base_2.0_facelift-removebg-preview (1).png",

   "assets/images/Mask Group 8.png",
    "assets/images/maxresdefault__3_-removebg-preview.png",
    "assets/images/commercial-vehicle-car-derived-van-RENAULT-KANGOO---1569330291074326072_big--19092416015509131300-removebg-preview.png",

  ];
  List <String > t=['smallFridge'.tr,'closedVan'.tr,'PersonnelServices'.tr,'tank'.tr,'OtherSmallVectors'.tr];
}
