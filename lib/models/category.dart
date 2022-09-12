class category {
  final String image;
  final String title;
  final int id;

  category( {
    required this.image,
    required this.title,
    required this.id,
  });

  factory category.fromJson(Map<String, dynamic> json) {
    return category(
      image: json['avatar'] as String,
      title: json['title'] as String,
      id: json['id'] as int,
    );
  }
}