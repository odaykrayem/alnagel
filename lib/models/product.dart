

class product {
  final String desc;
  final String title;
  final String images;
  final String cost;
  final String rate;
  final int id;

  product(  {
    required this.desc,
    required this.title,
    required this.id,
    required this.images,
    required  this.cost,
    required  this.rate,
  });

  factory product.fromJson(Map<String, dynamic> json) {
    return product(
      desc: json['desc'] as String,
      title: json['title'] as String,
      images: json['images'] as String,
      cost: json['cost'] as String,
      rate: json['rate'] as String,
      id: json['id'] as int,
    );
  }
}