import 'package:alnagel/chatting_app/models/chat_model.dart';
import 'package:alnagel/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.teal,
            )),
        title: Text(
          'الاعدادات'.tr,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'رسائلي'.tr,
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.align_horizontal_left_sharp,
                color: Colors.teal,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => chatItem(ChatModel(
                    id: 'dehfgyb',
                    name: 'new',
                    timeSent: DateTime.now(),
                    lastMsg: 'lastMsg')),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget chatItem(ChatModel chatModel) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getChattingScreen(chatModel.id));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        // width: 150,
        height: 110,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.chat,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  chatModel.name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  chatModel.timeSent.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  chatModel.lastMsg,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
