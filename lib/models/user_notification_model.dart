// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class UserNotificationModel {
  int id;
  int userId;
  String userName;
  String type;
  String cost;
  DateTime createdAt;

  UserNotificationModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.type,
    required this.cost,
    required this.createdAt,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) {
    return UserNotificationModel(
      id: json['id'] as int,
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.parse(json['user_id']),
      userName:
          json['user_name'] == null ? 'userName' : json['user_name'] as String,
      type: json['type'] as String,
      cost: json['cost'] as String,
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'type': type,
      'cost': cost,
      'created_at': createdAt.toString(),
    };
  }
}
