// lib/models/product_model.dart
class ProductModel {
  final String id;
  final String title;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'imageUrl': imageUrl,
  };
}
