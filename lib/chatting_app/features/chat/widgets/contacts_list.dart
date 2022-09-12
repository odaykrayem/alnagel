// import 'package:alnagel/chatting_app/models/group.dart';
import 'package:alnagel/chatting_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alnagel/chatting_app/common/widgets/loader.dart';
import 'package:alnagel/chatting_app/features/chat/controller/chat_controller.dart';
import 'package:alnagel/chatting_app/features/chat/screens/mobile_chat_screen.dart';
import 'package:alnagel/chatting_app/models/chat_contact.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.teal,
      //   child: Icon(
      //     Icons.chat_outlined,
      //     color: Colors.white,
      //   ),
      //   onPressed: () async {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const SelectContactsScreen()));
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // StreamBuilder<List<Group>>(
              //     stream: ref.watch(chatControllerProvider).chatGroups(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Loader();
              //       }

              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           var groupData = snapshot.data![index];

              //           return Column(
              //             children: [
              //               InkWell(
              //                 onTap: () {
              //                   Navigator.pushNamed(
              //                     context,
              //                     MobileChatScreen.routeName,
              //                     arguments: {
              //                       'name': groupData.name,
              //                       'uid': groupData.groupId,
              //                       'isGroupChat': true,
              //                       'profilePic': groupData.groupPic,
              //                     },
              //                   );
              //                 },
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(bottom: 8.0),
              //                   child: ListTile(
              //                     title: Text(
              //                       groupData.name,
              //                       style: const TextStyle(
              //                         fontSize: 18,
              //                       ),
              //                     ),
              //                     subtitle: Padding(
              //                       padding: const EdgeInsets.only(top: 6.0),
              //                       child: Text(
              //                         groupData.lastMessage,
              //                         style: const TextStyle(fontSize: 15),
              //                       ),
              //                     ),
              //                     leading: CircleAvatar(
              //                       backgroundImage: NetworkImage(
              //                         groupData.groupPic,
              //                       ),
              //                       radius: 30,
              //                     ),
              //                     trailing: Text(
              //                       DateFormat.Hm().format(groupData.timeSent),
              //                       style: const TextStyle(
              //                         color: Colors.grey,
              //                         fontSize: 13,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               const Divider(color: dividerColor, indent: 85),
              //             ],
              //           );
              //         },
              //       );
              //     }),
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
              StreamBuilder<List<ChatContact>>(
                  stream: ref.watch(chatControllerProvider).chatContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var chatContactData = snapshot.data![index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MobileChatScreen(
                                        name: chatContactData.name,
                                        uid: chatContactData.contactId))));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(11),
                            // width: 150,
                            height: 110,
                            decoration:
                                const BoxDecoration(color: Color(0xfff6f6f6)),
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
                                      chatContactData.name,
                                      style: TextStyle(
                                        color: Colors.grey[600],
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
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('yyyy-MM-dd  hh:mm')
                                          .format(chatContactData.timeSent),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        chatContactData.lastMessage,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

/**
 * Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => MobileChatScreen(
                                            name: chatContactData.name,
                                            uid: chatContactData.contactId))));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: Text(chatContactData.name, style: const TextStyle(fontSize: 18),),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      chatContactData.lastMessage,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  // leading: CircleAvatar(
                                  //   backgroundImage: NetworkImage(
                                  //     chatContactData.profilePic,
                                  //   ),
                                  //   backgroundColor: Colors.teal,
                                  //   radius: 30,
                                  // ),
                                  trailing: Text(
                                    DateFormat.Hm()
                                        .format(chatContactData.timeSent),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                                child: Divider(
                                    color: Colors.grey.withOpacity(0.5))),
                          ],
                        )
 * 
 */

}
