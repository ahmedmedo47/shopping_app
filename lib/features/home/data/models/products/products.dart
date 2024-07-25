import 'dart:convert';
import 'category.dart';

class Products {
  int? id;
  String title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  Category? category;

  Products({
    this.id,
    required this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory Products.fromMap(Map<String, dynamic> data) => Products(
        id: data['id'] as int?,
        title: data['title'] as String,
        price: data['price'] as int?,
        description: data['description'] as String?,
        images: data['images'] as List<String>?,
        creationAt: data['creationAt'] == null
            ? null
            : DateTime.parse(data['creationAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        category: data['category'] == null
            ? null
            : Category.fromMap(data['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'images': images,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'category': category?.toMap(),
      };

  factory Products.fromJson(String data) {
    return Products.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
