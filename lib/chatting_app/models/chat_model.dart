// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String id;
  final String name;
  final DateTime timeSent;
  final String lastMsg;

  ChatModel({
    required this.id,
    required this.name,
    required this.timeSent,
    required this.lastMsg,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'lastMsg': lastMsg,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      lastMsg: map['lastMsg'] ?? '',
      id: map['id'] ?? '',
    );
  }
}
