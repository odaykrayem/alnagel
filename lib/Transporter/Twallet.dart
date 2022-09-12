// ignore_for_file: file_names
import 'package:alnagel/Transporter/Buy/Twithdrawal.dart';
import 'package:flutter/material.dart';

class Twallet extends StatefulWidget {
  @override
  _TwalletState createState() => _TwalletState();
}

class _TwalletState extends State<Twallet> {
  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: hi,
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.teal,
                            )),
                        Text(
                          'الاعدادات',
                          style: TextStyle(color: Colors.teal),
                        )
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
                          Text(
                            'محفظتي',
                            style: TextStyle(color: Colors.teal, fontSize: 17),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.filter_list,
                                color: Colors.teal,
                                size: 25,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'الرصيد الكلي',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '25000 ر.س',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(thickness: 1),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'الرصيد المعلق',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('الرصيد المتاح للسحب',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('500 ر.س'),
                        Text('500 ر.س'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Twithdrawal('سحب الرصيد')));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 330,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'سحب الرصيد',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Twithdrawal('شحن الرصيد')));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 330,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'شحن الرصيد',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
    // }));
  }
}
