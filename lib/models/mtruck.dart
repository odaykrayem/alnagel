import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Truck {
  int id;
  String name;
  Truck({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Truck.fromMap(Map<String, dynamic> map) {
    return Truck(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Truck.fromJson(String source) =>
      Truck.fromMap(json.decode(source) as Map<String, dynamic>);
}
