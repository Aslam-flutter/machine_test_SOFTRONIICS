class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
  };
}
