import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class confirmmobile extends StatefulWidget {
  late String sentt;
  confirmmobile({required this.sentt});
  @override
  confirmmobile2 createState() => confirmmobile2(sentt: sentt);
}

class confirmmobile2 extends State<confirmmobile> {
  String sentt;
  confirmmobile2({required this.sentt});
  bool _onEditing = true;
  late String _code;
  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      //appBar: AppBar(backgroundColor:Colors.teal ,
      // ),
        body:
        // SingleChildScrollView(child:
        Container(
          color: Colors.teal,

            child:
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 40,),
                 Padding(
                   padding: const EdgeInsets.only(right:8.0),
                   child: Row(
                    textDirection: TextDirection.rtl,
                    children: [  IconButton(onPressed:() {
                      Navigator.of(context).pop();
                    },icon: Icon(Icons.arrow_forward),color: Colors.white,),
                      SizedBox(width: 5,),

                      Text('تأكيد الرقم',style: TextStyle(color: Colors.white,fontSize: 15),),


                    ],),
                 ),
                SizedBox(height: 8,),
                Center(

                  child: Container( width: 330,
                      decoration: const BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight:  Radius.circular(20),
                              bottomLeft:  Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 26, top: 15,bottom: 150),


                          child: Column(children: [  SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),

                            ),

                             Padding(
                               padding: const EdgeInsets.only(right: 15),
                               child: Container(alignment: Alignment.center,child:Image.asset('assets/images/lf30_editor_2ocztohd.png') ),
                             ),
                            SizedBox(height: 20,),
                            Text('من فضلك قم بإدخال الكود المرسل ال ',style: TextStyle(fontSize: 15),),
                            Text('${sentt}'),
                            SizedBox(height: 10,),
                            VerificationCode(
                              keyboardType: TextInputType.number,
                              length: 4,
                              cursorColor: Colors.teal,
                              underlineColor: Colors.teal,
                              autofocus: false,
                              onCompleted: (String value) {
                                print(value);
                                setState(() {
                                  _code = value;
                                });
                              },
                              onEditing: (bool value) {
                                setState(() {
                                  _onEditing = value;
                                });
                              },
                            ),

                            SizedBox(height: 20,),


                            ElevatedButton(

                              onPressed: () {
                              showDialog(builder: (BuildContext context)  =>
                                AlertDialog(content: Container(height: 150,
                                  child: Column(children: [
                                    Text('تهانينا  !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Icon(Icons.done,color: Colors.green,size: 80,),
                                    Text('تم تأكيد الدخول بنجاح',style: TextStyle(fontSize: 20),),


                                  ],),
                                ),) , context: context);
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.black54,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),

                                child: Container(decoration: BoxDecoration(color: Colors.black26,
                                  borderRadius: BorderRadius.circular(10),),
                                  width: 260,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'تأكيد',
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                ),

                            ),
                            SizedBox(width: 20,),
                            Row(children: [   SizedBox(width: 115,),
                              TextButton(onPressed: (){}, child: Text('!أعد الإرسال ',style: TextStyle(color: Colors.teal),)),

                              Text('لم تستلم الرمز؟',textAlign: TextAlign.left,),
                            ],),







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
