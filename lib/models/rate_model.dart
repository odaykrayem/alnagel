// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class RateModel {
  int id;
  int userId;
  String comment;
  int star;
  DateTime createdAt;

  RateModel({
    required this.id,
    required this.userId,
    required this.comment,
    required this.star,
    required this.createdAt,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      id: json['id'] as int,
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.parse(json['user_id']),
      star: json['star'] is int ? json['star'] as int : int.parse(json['star']),
      comment: json['comment'] as String,
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'star': star,
      'comment': comment,
      'created_at': createdAt.toString(),
    };
  }
}
