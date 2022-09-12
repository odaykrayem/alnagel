import 'package:alnagel/componant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tnotifications extends StatefulWidget {
  @override
  _TnotificationsState createState() => _TnotificationsState();
}

class _TnotificationsState extends State<Tnotifications> {
  @override
        Widget build(BuildContext context) {
          double hi = MediaQuery.of(context).size.height;

    return Scaffold(
                backgroundColor: Color.fromARGB(255, 232, 226, 226),
                body:
                  SingleChildScrollView(
                    child: Container(
                      
                        child:
                        Column(
                          children: [
                          Container (height:150,width: 360,alignment: Alignment.center,
                            decoration: BoxDecoration(color: Color(int.parse("0xff${hexString}")),
                                borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40) ,
                        topRight:Radius.circular(2),topLeft: Radius.circular(2) )),
                          child: Container( decoration: BoxDecoration( color:Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ,
                                  topRight:Radius.circular(20),topLeft: Radius.circular(20) )),
                             child: Image.asset('assets/images/n.png',height: 70,width: 130,)),),
                          SizedBox(height: 10,),
                           

                           Container(
                            margin: EdgeInsets.all(8),
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
                                        Text('الاشعارات' , style: TextStyle(color: Colors.teal),)
                                      ],
                                    ),
                                  ],
                                ),
                              


                            Container(
                              height: hi-300,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: ((context, index) {
                                return itmes();
                              })),
                            )
                                
                              ],
                            ),
                            ),



                           

                        ],)
              )
                    ),



                // bottomNavigationBar: bottomnavbar(co)

              );
    // }));
  }

  Widget itmes() {
    return Container(
      color: Color.fromARGB(12, 0, 0, 0),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
         Row(
          children: [
          Icon(Icons.notifications , color: Colors.black54,),
          SizedBox(width: 8,),
          Text('تمت الموافقة على عرضك' , style: TextStyle(color: Colors.black54),)
         ],),
         SizedBox(height: 8,),
         Row(
          children: [
          Icon(Icons.calendar_month_rounded , color: Colors.black54,),
          SizedBox(width: 8,),
          Text('02/05/2022' , style: TextStyle(color: Colors.black54),)
         ],)
        ],
      ),
    );
  }
}
