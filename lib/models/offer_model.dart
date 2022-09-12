// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class OfferModel {
  final int id;
  final int userId;
  final String orderId;
  final String cost;
  final String state;
  final DateTime createdAt;

  OfferModel({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.cost,
    required this.state,
    required this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      userId:
          json['user_id'] is int ? json['user_id'] : int.parse(json['user_id']),
      orderId: json['order_id'],
      cost: json['cost'],
      state: json['state'] is String ? json['state'] : '${json['state']}',
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_id': orderId,
      'cost': cost,
      'state': state,
      'created_at': createdAt.toString(),
    };
  }

  @override
  String toString() {
    return 'OfferModel(id: $id, userId: $userId, orderId: $orderId, cost: $cost, state: $state, createdAt: $createdAt)';
  }
}
