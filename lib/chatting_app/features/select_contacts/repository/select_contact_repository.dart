import 'package:alnagel/chatting_app/models/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alnagel/chatting_app/common/utils/utils.dart';
import 'package:alnagel/chatting_app/models/user_model.dart';
import 'package:alnagel/chatting_app/features/chat/screens/mobile_chat_screen.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<ContactModel>> getContacts() async {
    List<ContactModel> contacts = [];
    try {
      //TODO Get list from DB

      contacts = [
        ContactModel(id: '26', displayName: 'oday', photo: 'photo'),
        ContactModel(id: '27', displayName: 'oday2', photo: 'photo'),
        ContactModel(id: '3', displayName: 'name', photo: 'photo'),
      ];
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(ContactModel selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;
      debugPrint('selectedConId: ${selectedContact.id}');

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        if (selectedContact.id == userData.id) {
          isFound = true;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MobileChatScreen(
                      name: userData.name, uid: userData.uid)));
          // Navigator.pushNamed(
          //   context,
          //   MobileChatScreen.routeName,
          //   arguments: {
          //     'name': userData.name,
          //     'uid': userData.uid,
          //   },
          // );
        }
      }

      if (!isFound) {
        showSnackBar(
          context: context,
          content: 'This id does not exist on this app.',
        );
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
