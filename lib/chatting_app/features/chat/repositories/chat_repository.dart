// import 'package:alnagel/chatting_app/models/group.dart';
// import 'package:alnagel/chatting_app/common/repositories/common_firebase_storage_repository.dart';

// import 'dart:io';
import 'package:alnagel/controllers/app_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:alnagel/chatting_app/common/enums/message_enum.dart';
import 'package:alnagel/chatting_app/common/providers/message_reply_provider.dart';
import 'package:alnagel/chatting_app/common/utils/utils.dart';
import 'package:alnagel/chatting_app/models/chat_contact.dart';
import 'package:alnagel/chatting_app/models/message.dart';
import 'package:alnagel/chatting_app/models/user_model.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ChatRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<List<ChatContact>> getChatContacts() {
    String search = '';

    if (auth.currentUser == null) {
      search = '+' + Get.find<AppController>().getUserInfo()!.phone;
      debugPrint('search' + search);
    } else {
      search = auth.currentUser!.uid;
    }

    return firestore
        .collection('users')
        .doc(search)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContact> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContact.fromMap(document.data());
        var userData = await firestore
            .collection('users')
            .doc(chatContact.contactId)
            .get();
        var user = UserModel.fromMap(userData.data()!);

        contacts.add(
          ChatContact(
            name: user.name,
            profilePic: 'pp',
            contactId: chatContact.contactId,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage,
          ),
        );
      }
      return contacts;
    });
  }

  // Stream<List<Group>> getChatGroups() {
  //   return firestore.collection('groups').snapshots().map((event) {
  //     List<Group> groups = [];
  //     for (var document in event.docs) {
  //       var group = Group.fromMap(document.data());
  //       if (group.membersUid.contains(auth.currentUser!.uid)) {
  //         groups.add(group);
  //       }
  //     }
  //     return groups;
  //   });
  // }

  Stream<List<Message>> getChatStream(String recieverUserId) {
    String userUID;
    if (auth.currentUser == null) {
      userUID = Get.find<AppController>().getUserInfo()!.uuid;
    } else {
      userUID = auth.currentUser!.uid;
    }
    return firestore
        .collection('users')
        .doc(userUID)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];
      for (var document in event.docs) {
        messages.add(Message.fromMap(document.data()));
      }
      return messages;
    });
  }

  Stream<List<Message>> getGroupChatStream(String groudId) {
    return firestore
        .collection('groups')
        .doc(groudId)
        .collection('chats')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];
      for (var document in event.docs) {
        messages.add(Message.fromMap(document.data()));
      }
      return messages;
    });
  }

  void _saveDataToContactsSubcollection(
    UserModel senderUserData,
    UserModel? recieverUserData,
    String text,
    DateTime timeSent,
    String recieverUserId,
    bool isGroupChat,
  ) async {
    if (isGroupChat) {
      await firestore.collection('groups').doc(recieverUserId).update({
        'lastMessage': text,
        'timeSent': DateTime.now().millisecondsSinceEpoch,
      });
    } else {
// users -> reciever user id => chats -> current user id -> set data
      String userUID;
      if (auth.currentUser == null) {
        userUID = Get.find<AppController>().getUserInfo()!.uuid;
      } else {
        userUID = auth.currentUser!.uid;
      }
      var recieverChatContact = ChatContact(
        name: senderUserData.name,
        profilePic: 'profilePic',
        contactId: senderUserData.uid,
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(userUID)
          .set(
            recieverChatContact.toMap(),
          );
      // users -> current user id  => chats -> reciever user id -> set data
      var senderChatContact = ChatContact(
        name: recieverUserData!.name,
        profilePic: 'profilePic',
        contactId: recieverUserData.uid,
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(userUID)
          .collection('chats')
          .doc(recieverUserId)
          .set(
            senderChatContact.toMap(),
          );
    }
  }

  void _saveMessageToMessageSubcollection({
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required MessageEnum messageType,
    required MessageReply? messageReply,
    required String senderUsername,
    required String? recieverUserName,
    required bool isGroupChat,
  }) async {
    String userUID;
    if (auth.currentUser == null) {
      userUID = Get.find<AppController>().getUserInfo()!.uuid;
    } else {
      userUID = auth.currentUser!.uid;
    }
    final message = Message(
      senderId: userUID,
      recieverid: recieverUserId,
      text: text,
      type: messageType,
      timeSent: timeSent,
      messageId: messageId,
      isSeen: false,
      repliedMessage: messageReply == null ? '' : messageReply.message,
      repliedTo: messageReply == null
          ? ''
          : messageReply.isMe
              ? senderUsername
              : recieverUserName ?? '',
      repliedMessageType:
          messageReply == null ? MessageEnum.text : messageReply.messageEnum,
    );
    if (isGroupChat) {
      // groups -> group id -> chat -> message
      await firestore
          .collection('groups')
          .doc(recieverUserId)
          .collection('chats')
          .doc(messageId)
          .set(
            message.toMap(),
          );
    } else {
      // users -> sender id -> reciever id -> messages -> message id -> store message
      await firestore
          .collection('users')
          .doc(userUID)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toMap(),
          );
      // users -> eciever id  -> sender id -> messages -> message id -> store message
      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(userUID)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toMap(),
          );
    }
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
    required MessageReply? messageReply,
    required bool isGroupChat,
  }) async {
    try {
      debugPrint('chatauthrepo');

      var timeSent = DateTime.now();
      UserModel? recieverUserData;

      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(recieverUserId).get();
        recieverUserData = UserModel.fromMap(userDataMap.data()!);
      }

      var messageId = const Uuid().v1();

      //TODO
      // var messageId = 'sss';
      debugPrint('sendMsg2');
      _saveDataToContactsSubcollection(
        senderUser,
        recieverUserData,
        text,
        timeSent,
        recieverUserId,
        isGroupChat,
      );

      _saveMessageToMessageSubcollection(
        recieverUserId: recieverUserId,
        text: text,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        username: senderUser.name,
        messageReply: messageReply,
        recieverUserName: recieverUserData?.name,
        senderUsername: senderUser.name,
        isGroupChat: isGroupChat,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  // void sendFileMessage({
  //   required BuildContext context,
  //   required File file,
  //   required String recieverUserId,
  //   required UserModel senderUserData,
  //   required ProviderRef ref,
  //   required MessageEnum messageEnum,
  //   required MessageReply? messageReply,
  //   required bool isGroupChat,
  // }) async {
  //   try {
  //     var timeSent = DateTime.now();
  //     var messageId = const Uuid().v1();

  //     String imageUrl = await ref
  //         .read(commonFirebaseStorageRepositoryProvider)
  //         .storeFileToFirebase(
  //           'chat/${messageEnum.type}/${senderUserData.uid}/$recieverUserId/$messageId',
  //           file,
  //         );

  //     UserModel? recieverUserData;
  //     if (!isGroupChat) {
  //       var userDataMap =
  //           await firestore.collection('users').doc(recieverUserId).get();
  //       recieverUserData = UserModel.fromMap(userDataMap.data()!);
  //     }

  //     String contactMsg;

  //     switch (messageEnum) {
  //       case MessageEnum.image:
  //         contactMsg = '📷 Photo';
  //         break;
  //       case MessageEnum.video:
  //         contactMsg = '📸 Video';
  //         break;
  //       case MessageEnum.audio:
  //         contactMsg = '🎵 Audio';
  //         break;
  //       case MessageEnum.gif:
  //         contactMsg = 'GIF';
  //         break;
  //       default:
  //         contactMsg = 'GIF';
  //     }
  //     _saveDataToContactsSubcollection(
  //       senderUserData,
  //       recieverUserData,
  //       contactMsg,
  //       timeSent,
  //       recieverUserId,
  //       isGroupChat,
  //     );

  //     _saveMessageToMessageSubcollection(
  //       recieverUserId: recieverUserId,
  //       text: imageUrl,
  //       timeSent: timeSent,
  //       messageId: messageId,
  //       username: senderUserData.name,
  //       messageType: messageEnum,
  //       messageReply: messageReply,
  //       recieverUserName: recieverUserData?.name,
  //       senderUsername: senderUserData.name,
  //       isGroupChat: isGroupChat,
  //     );
  //   } catch (e) {
  //     showSnackBar(context: context, content: e.toString());
  //   }
  // }

  // void sendGIFMessage({
  //   required BuildContext context,
  //   required String gifUrl,
  //   required String recieverUserId,
  //   required UserModel senderUser,
  //   required MessageReply? messageReply,
  //   required bool isGroupChat,
  // }) async {
  //   try {
  //     var timeSent = DateTime.now();
  //     UserModel? recieverUserData;

  //     if (!isGroupChat) {
  //       var userDataMap =
  //           await firestore.collection('users').doc(recieverUserId).get();
  //       recieverUserData = UserModel.fromMap(userDataMap.data()!);
  //     }

  //     var messageId = const Uuid().v1();

  //     _saveDataToContactsSubcollection(
  //       senderUser,
  //       recieverUserData,
  //       'GIF',
  //       timeSent,
  //       recieverUserId,
  //       isGroupChat,
  //     );

  //     _saveMessageToMessageSubcollection(
  //       recieverUserId: recieverUserId,
  //       text: gifUrl,
  //       timeSent: timeSent,
  //       messageType: MessageEnum.gif,
  //       messageId: messageId,
  //       username: senderUser.name,
  //       messageReply: messageReply,
  //       recieverUserName: recieverUserData?.name,
  //       senderUsername: senderUser.name,
  //       isGroupChat: isGroupChat,
  //     );
  //   } catch (e) {
  //     showSnackBar(context: context, content: e.toString());
  //   }
  // }

  void setChatMessageSeen(
    BuildContext context,
    String recieverUserId,
    String messageId,
  ) async {
    String userUID;
    if (auth.currentUser == null) {
      userUID = Get.find<AppController>().getUserInfo()!.uuid;
    } else {
      userUID = auth.currentUser!.uid;
    }
    try {
      await firestore
          .collection('users')
          .doc(userUID)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});

      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(userUID)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
