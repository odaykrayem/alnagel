// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class OrderModel {
  final int id;
  final String type;
  final String user_id;
  final String cost;
  final String tax;
  final String tax2;
  final String notes;
  final String from;
  final String to;
  final String at_time;
  final String from_x;
  final String from_y;
  final String to_x;
  final String to_y;
  final String state;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.type,
    required this.user_id,
    required this.cost,
    required this.tax,
    required this.tax2,
    required this.notes,
    required this.from,
    required this.to,
    required this.at_time,
    required this.from_x,
    required this.from_y,
    required this.to_x,
    required this.to_y,
    required this.state,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int,
      type: json['type'] as String,
      user_id: json['user_id'] as String,
      cost: json['cost'] as String,
      tax: json['tax'] as String,
      tax2: json['tax2'] as String,
      notes: json['notes'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      at_time: json['at_time'] as String,
      from_x: json['from_x'] as String,
      from_y: json['from_y'] as String,
      to_x: json['to_x'] as String,
      to_y: json['to_y'] as String,
      state: json['state'] as String,
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'user_id': user_id,
      'cost': cost,
      'tax': tax,
      'tax2': tax2,
      'notes': notes,
      'from': from,
      'to': to,
      'at_time': at_time,
      'from_x': from_x,
      'from_y': from_y,
      'to_x': to_x,
      'to_y': to_y,
      'state': state,
      'created_at': createdAt.toString(),
    };
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, type: $type, user_id: $user_id, cost: $cost, tax: $tax, tax2: $tax2, notes: $notes, from: $from, to: $to, at_time: $at_time, from_x: $from_x, from_y: $from_y, to_x: $to_x, to_y: $to_y, state: $state, createdAt: $createdAt)';
  }
}
