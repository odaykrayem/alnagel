// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChattingScreen extends StatefulWidget {
  final String chatId;
  const ChattingScreen({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Image.asset('assets/icons/Group 8773.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                        5,
                        (index) => Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                              size: 15,
                            )),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 4)),
                ),
                child: Text(
                  ' في انتظار الدفع',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey[400],
              ),
              Icon(
                Icons.phone_in_talk_sharp,
                color: Colors.grey[400],
              ),
              Icon(
                Icons.more_vert_outlined,
                color: Colors.grey[400],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      messageItem(index % 2 == 0, context)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget messageItem(bool fromMe, BuildContext context) {
    return Row(
      mainAxisAlignment:
          fromMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        fromMe
            ? IntrinsicWidth(
                child: Container(
                  // height: 125,
                  width: MediaQuery.of(context).size.width / 1.3,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.3,
                      minHeight: 100,
                      maxHeight: 120),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Stack(children: [
                    Positioned(
                      right: 8,
                      top: 30,
                      child: Transform.rotate(
                        angle: 92,
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Color(0xff00afa0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xff00afa0),
                        ),
                        child: Text(
                          'smnjsfhbsbfbsdhfbahafdsmnjsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbafdsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbafd',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            : IntrinsicWidth(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(5),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.3),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Text(
                    'smnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafdsmnjsfhbsbfbsdhfbahafd',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
      ],
    );
  }
}
