import 'package:alnagel/chatting_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:alnagel/controls/home_control.dart';
import 'package:alnagel/models/my_requests.dart';
import 'package:alnagel/user/orderdetails.dart';
import 'package:alnagel/paymntnotdoneinconversation.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../calldriver.dart';
import '../componant.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({Key? key}) : super(key: key);

  @override
  UserOrdersState createState() => UserOrdersState();
}

class UserOrdersState extends State<UserOrders> {
  home_Control _home_control = home_Control();
  bool current = true;

  List<MyRequest>? Lrequests = [];
  List<MyRequest>? LrequestsOld = [];

  getrequests() {
    _home_control.getOrders().then((value) => setState(() {
          Lrequests = value;
        }));
  }

  getrequestsOld() {
    _home_control.getLatestOrder().then((value1) => setState(() {
          LrequestsOld = value1!;
        }));
  }

  @override
  void initState() {
    getrequests();
    getrequestsOld();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'requests'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      body:
          //SingleChildScrollView(
          //child:
          SingleChildScrollView(
        child: Container(
            child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 44,
              child: Card(
                child: Row(children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          current = false;
                        });
                      },
                      child: Text(
                        'PreviousOrders'.tr,
                        style: TextStyle(
                            color: current ? Colors.grey : Colors.teal),
                      ),
                    ),
                  ),
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      setState(() {
                        current = true;
                      });
                    },
                    child: Text(
                      'currentOrders'.tr,
                      style:
                          TextStyle(color: current ? Colors.teal : Colors.grey),
                    ),
                  ))
                ]),
              )),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              itemCount: current ? Lrequests!.length : LrequestsOld!.length,
              itemBuilder: (context, index) {
                debugPrint(Lrequests![index].toString());
                return current
                    ? items(Lrequests![index])
                    : pastorderwidget(LrequestsOld![index]);
              },
            ),
          ),
        ])),
      ),
      // ),
      //      bottomSheet: bottomnavbar(co)
    );
    // }));
  }

  Widget pastorderwidget(MyRequest req) {
    var date = DateFormat('yyyy-MM-dd').format(DateTime.parse(req.at_time));
    return FlatButton(
      onPressed: () {},
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          //IconButton(icon:Icon(Icons.), onPressed: ()  {
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      height: 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      orderdetails(req: req)));
                        },
                        child: Container(
                            height: 20,
                            width: 60,
                            alignment: Alignment.topRight,
                            child: Text(
                              'OrderDetails'.tr,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.end,
                            )),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      height: 30,
                      child: Container(
                        height: 20,
                        width: 60,
                        alignment: Alignment.topRight,
                        child: Text('FileAComplaint'.tr,
                            style: const TextStyle(fontSize: 13)),
                      ),
                      value: 2,
                    ),
                  ]),
          // },),
          const SizedBox(
            width: 88,
          ),
          Column(children: [
            Row(
              children: [
                const SizedBox(
                  width: 3,
                ),
                Text(
                  req.type,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(children: [
              const Text('ر.س'),
              Text(
                  (double.parse(req.cost) + (double.parse(req.cost) * 0.15))
                      .toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(
                width: 8,
              ),
              Text(date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const Icon(
                Icons.access_time,
                color: Colors.grey,
                size: 15,
              ),
            ]),
          ]),
          const SizedBox(
            width: 1,
          ),
          const CircleAvatar(
            radius: 22,
          ),
        ]),
      ),
    );
  }

  Widget items(MyRequest requests) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        onPressed: () {},
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.teal,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                Text(
                  'tracking'.tr,
                  style: const TextStyle(fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.message_outlined,
                  color: Colors.teal,
                  size: 20,
                ),
                onPressed: () {
                  debugPrint('dId: ${requests.driver_id}');
                  if (requests.driver_id != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectContactsScreen(
                                driverId: requests.driver_id!)));
                  } else {
                    showToast(text: 'لم يتم الموافقة على الطلب من اي ناقل بعد');
                  }
                },
              ),
              Text('chat'.tr, style: const TextStyle(fontSize: 10))
            ]),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => calldriver()));
                },
              ),
              Text('Contact'.tr, style: const TextStyle(fontSize: 10))
            ]),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.contact_page_outlined,
                  color: Colors.teal,
                  size: 20,
                ),
                onPressed: () {
                  debugPrint('${requests.id}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => orderdetails(req: requests)));
                },
              ),
              Text('OrderDetails'.tr, style: const TextStyle(fontSize: 10))
            ]),
            const SizedBox(
              width: 10,
            ),
            Column(children: [
              const Text('علي', style: const TextStyle(fontSize: 10)),
              RatingBarIndicator(
                rating: 2.75,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 8.0,
                direction: Axis.horizontal,
              ),
              Text('رقم الطلب  ${requests.id}',
                  style: const TextStyle(fontSize: 10)),
            ]),
            const SizedBox(
              width: 12,
            ),
            const CircleAvatar(
              radius: 16,
            ),
          ]),
        ),
      ),
    );
  }
}
