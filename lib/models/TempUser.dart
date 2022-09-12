// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names
//to save user data and using it in riverpod structure
class TempUser {
  final String name;
  final String email;
  final String phone;
  final String password;

  TempUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory TempUser.fromJson(Map<String, dynamic> json) {
    return TempUser(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, password: $password)';
  }
}
