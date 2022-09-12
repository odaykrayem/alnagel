import 'package:alnagel/componant.dart';
import 'package:alnagel/models/user_notification_model.dart';
import 'package:alnagel/user/user_offer_details.dart';
import 'package:alnagel/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNotificationsScreen extends StatefulWidget {
  @override
  _UserNotificationsScreenState createState() =>
      _UserNotificationsScreenState();
}

class _UserNotificationsScreenState extends State<UserNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(create: (BuildContext context) => cubitapi(),
    // child: BlocConsumer<cubitapi, statesapi>(
    // listener: (context, state) {},
    // builder: (context, state) {
    // cubitapi co = cubitapi.get(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          'الاشعارات',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return itmes(UserNotificationModel(
                            id: 1,
                            userId: 1,
                            userName: 'userName',
                            type: 'type',
                            cost: 'cost',
                            createdAt: DateTime.now()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: bottomnavbar(co)
    );
    // }));
  }

  Widget itmes(UserNotificationModel userNotModel) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: ((context) => UserNotiDetails(
            //           userNotModel: userNotModel,
            //         ))));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userNotModel.userName),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'ARequestHasBeenSentFromTheDriver'.tr,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userNotModel.cost,
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(Icons.attach_money_rounded,
                          color: Colors.grey),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(userNotModel.type,
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(
                        Icons.work_outline_rounded,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(getTime(userNotModel.createdAt),
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(Icons.access_time, color: Colors.grey),
                    ]),
              ]),
              const SizedBox(
                width: 35,
              ),
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.teal,
              ),
            ]),
          ),
        ),
        Container(width: 300, child: const Divider()),
      ],
    );
  }
}
