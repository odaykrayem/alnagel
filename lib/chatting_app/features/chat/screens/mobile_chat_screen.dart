// import 'package:alnagel/chatting_app/features/call/controller/call_controller.dart';
// import 'package:alnagel/chatting_app/features/call/screens/call_pickup_screen.dart';
import 'package:alnagel/chatting_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alnagel/chatting_app/common/widgets/loader.dart';
import 'package:alnagel/chatting_app/features/auth/controller/auth_controller.dart';
import 'package:alnagel/chatting_app/features/chat/widgets/bottom_chat_field.dart';
import 'package:alnagel/chatting_app/models/user_model.dart';
import 'package:alnagel/chatting_app/features/chat/widgets/chat_list.dart';
import 'package:get/get.dart';

class MobileChatScreen extends ConsumerWidget {
  final String name;
  final String uid;

  const MobileChatScreen({
    Key? key,
    required this.name,
    required this.uid,
  }) : super(key: key);

  // void makeCall(WidgetRef ref, BuildContext context) {
  //   ref.read(callControllerProvider).makeCall(
  //         context,
  //         name,
  //         uid,
  //         profilePic,
  //         isGroupChat,
  //       );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return CallPickupScreen(
    // scaffold:Scaffold(
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
        child: Column(
          children: [
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
                StreamBuilder<UserModel>(
                    stream: ref.read(authControllerProvider).userDataById(uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name),
                          // Text(
                          //   snapshot.data!.isOnline ? 'online' : 'offline',
                          //   style: const TextStyle(
                          //     fontSize: 13,
                          //     fontWeight: FontWeight.normal,
                          //   ),
                          // ),
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
                      );
                    }),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'name',
                //       style: const TextStyle(
                //         color: Colors.grey,
                //         fontSize: 17,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     Wrap(
                //       children: List.generate(
                //           5,
                //           (index) => Icon(
                //                 Icons.star,
                //                 color: Colors.yellow[600],
                //                 size: 15,
                //               )),
                //     ),
                //   ],
                // ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 4)),
                  ),
                  child: const Text(
                    ' في انتظار الدفع',
                    style: TextStyle(
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ChatList(
                recieverUserId: uid,
                isGroupChat: false,
              ),
            ),
            BottomChatField(
              recieverUserId: uid,
              isGroupChat: false,
            ),
          ],
        ),
      ),
    );
    // );
  }
}
