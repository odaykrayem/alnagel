class massage {
  final String token;
  final String title;
  final String msg;

  massage({
    required this.token,
    required this.title,
    required this.msg,
  });

  factory massage.fromJson(Map<String, dynamic> json) {
    return massage(
      token: json['token'] as String,
      title: json['title'] as String,
      msg: json['msg'] as String,
    );
  }
}
