// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class ServiceModel {
  int id;
  int userId;
  String type;
  String detail;
  DateTime createdAt;
  ServiceModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.detail,
    required this.createdAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.parse(json['user_id']),
      type: json['type'] as String,
      detail: json['detail'] as String,
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'detail': detail,
      'created_at': createdAt.toString(),
    };
  }
}
