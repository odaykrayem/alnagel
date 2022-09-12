import 'package:flutter/material.dart';

class Tfavourite extends StatefulWidget {
  @override
  _TfavouriteState createState() => _TfavouriteState();
}

class _TfavouriteState extends State<Tfavourite> {
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
                            'المفضلة',
                            style: TextStyle(color: Colors.teal, fontSize: 20),
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
                Container(
                  height: hi - 160,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return request(context);
                      })),
                )
              ],
            ),
          ),
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
    // }));
  }

  Widget request(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('Torder_details');
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 82, 82, 82),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Center(
                        child: Text(
                      "تريله ماء",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 120,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'موقع التسليم',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                Text('الرياض', style: TextStyle(fontSize: 11)),
                                Text('شارع الحديقة',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'موقع الاستلام',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                Text('المدينة', style: TextStyle(fontSize: 11)),
                                Text('شارع النور',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 18,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      'الموعد',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                Text('02/7', style: TextStyle(fontSize: 11)),
                                Text('9 ص', style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    ),
                                    Text(
                                      'السعر',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 11),
                                    )
                                  ],
                                ),
                                Text('5000', style: TextStyle(fontSize: 11)),
                                Text('ر.س', style: TextStyle(fontSize: 11)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    child: ElevatedButton(
                      onPressed: () {},
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
                        width: 360,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'قدم العرض الان',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
