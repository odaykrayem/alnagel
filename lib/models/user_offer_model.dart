// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class UserOfferModel {
  int id;
  int userId;
  int orderId;
  String? userName;
  String? type;
  String cost;
  String state;
  DateTime createdAt;

  UserOfferModel({
    required this.id,
    required this.userId,
    required this.orderId,
    this.userName,
    this.type,
    required this.cost,
    required this.state,
    required this.createdAt,
  });

  factory UserOfferModel.fromJson(Map<String, dynamic> json) {
    return UserOfferModel(
      id: json['id'] as int,
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.parse(json['user_id']),
      orderId: json['order_id'] is int
          ? json['order_id'] as int
          : int.parse(json['order_id']),
      userName:
          json['user_name'] == null ? 'userName' : json['user_name'] as String,
      cost: json['cost'] as String,
      state: json['state'] as String,
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_id': orderId,
      'user_name': userName,
      'type': type,
      'cost': cost,
      'state': state,
      'created_at': createdAt.toString(),
    };
  }
}
