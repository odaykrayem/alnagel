// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String uid;
  final String id;
  final bool isOnline;
  final String phoneNumber;
  // final String profilePic;
  // final List<String> groupId;
  UserModel({
    required this.name,
    required this.uid,
    required this.id,
    required this.isOnline,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'id': id,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      // 'profilePic': profilePic,
      // 'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      id: map['id'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      // profilePic: map['profilePic'] ?? '',
      // groupId: List<String>.from(map['groupId']),
    );
  }
}
