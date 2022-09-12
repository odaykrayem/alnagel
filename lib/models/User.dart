// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names
class User {
  final String name;
  final String api_token;
  final String email;
  final String phone;
  final int id;
  final String type;
  final String uuid;

  User({
    required this.name,
    required this.api_token,
    required this.email,
    required this.phone,
    required this.id,
    required this.type,
    required this.uuid,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      api_token: json['api_token'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      type: json['type'] is String ? json['type'] as String : '${json['type']}',
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'api_token': api_token,
      'email': email,
      'phone': phone,
      'type': type,
      'uuid': uuid,
    };
  }

  @override
  String toString() {
    return 'User(name: $name, api_token: $api_token, email: $email, phone: $phone, id: $id, type: $type)';
  }
}
