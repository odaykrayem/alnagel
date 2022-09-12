import 'package:flutter/foundation.dart';

class Banner {
  final String image;

  final int id;

  Banner( {
    required this.image,

    required this.id,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      image: json['banner'] as String,
      id: json['id'] as int,
    );
  }
}