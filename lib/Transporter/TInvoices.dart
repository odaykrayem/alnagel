import 'package:alnagel/componant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TInvoices extends StatefulWidget {
  @override
  _TInvoicesState createState() => _TInvoicesState();
}

class _TInvoicesState extends State<TInvoices> {
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
                                      Text('الفواتير' , style: TextStyle(color: Colors.teal , fontSize: 20),),
                                          IconButton(onPressed: (){
                                       Navigator.of(context).pop();
                                          }, icon: Icon(Icons.filter_list , color: Colors.teal, size: 25,)),
                                    ],
                                  ),
                              ],
                            ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
       Column(
        children: [
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.car_crash_rounded),
                SizedBox(width: 8,),
                Text('نوع الخدمة  '),
              ],
            ),
                SizedBox(width: 20,),

            Text('نقل فان')
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 8,),
            Text('التاريخ'),
              ],
            ),
                SizedBox(width: 30,),

            Text('02/05/2022')
            
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.warning_rounded),
            SizedBox(width: 8,),
            Text('المسافة             '),
              ],
            ),
                SizedBox(width: 20,),

            Text('12 كم')

          ],
        ),
        
       ],),

       Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: [
            Text('11500 ر.س'),
                SizedBox(height: 15,),

            Text('تم الاستلام',style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold),),
          ],
        ),
       )
      ],)
    );
  }
}
