// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget items(double wi, String title, String subTitle, context, String push) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed(push);
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      color: Colors.white,
      width: wi / 3.6,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 3, 184, 166)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Icon(
                  Icons.add,
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget requests(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed('Torder_details');
    },
    child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 82, 82, 82),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5))),
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: const Center(
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
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.only(
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
                                children: const [
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
                              const Text('الرياض',
                                  style: TextStyle(fontSize: 11)),
                              const Text('شارع الحديقة',
                                  style: TextStyle(fontSize: 11)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
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
                              const Text('المدينة',
                                  style: TextStyle(fontSize: 11)),
                              const Text('شارع النور',
                                  style: TextStyle(fontSize: 11)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
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
                              const Text('02/7',
                                  style: TextStyle(fontSize: 11)),
                              const Text('9 ص', style: TextStyle(fontSize: 11)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
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
                              const Text('5000',
                                  style: TextStyle(fontSize: 11)),
                              const Text('ر.س', style: TextStyle(fontSize: 11)),
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
                    onPressed: () {
                      Navigator.of(context).pushNamed('Torder_details');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 330,
                      height: 40,
                      alignment: Alignment.center,
                      child: const Text(
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
