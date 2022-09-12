// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:intl/intl.dart';

class CarrierModel {
  int id;
  int type;
  int size;
  int tall;
  int weight;
  DateTime createdAt;

  CarrierModel({
    required this.id,
    required this.type,
    required this.size,
    required this.tall,
    required this.weight,
    required this.createdAt,
  });

  factory CarrierModel.fromJson(Map<String, dynamic> json) {
    return CarrierModel(
      id: json['id'] as int,
      type: json['type'] is int ? json['type'] as int : int.parse(json['type']),
      size: json['size'] is int
          ? json['size'] as int
          : json['size'] is double
              ? (json['size'] as double).toInt()
              : double.parse(json['size']).toInt(),
      tall: json['tall'] is int ? json['tall'] as int : int.parse(json['tall']),
      weight: json['weight'] is int
          ? json['weight'] as int
          : int.parse(json['weight']),
      createdAt: DateFormat("yyyy-MM-dd hh:mm")
          .parse(DateTime.parse(json['created_at'] as String).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'size': type,
      'tall': tall,
      'weight': weight,
      'created_at': createdAt.toString(),
    };
  }
}
