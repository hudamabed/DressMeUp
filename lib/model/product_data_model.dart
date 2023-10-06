import 'dart:convert';
import 'category_model.dart';

ProductData productFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  int id;
  String title;
  dynamic price;
  String description;
  Category category;
  List<dynamic> images;
  String creationAt;
  String updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProductData && title == other.title;

  @override
  int get hashCode => title.hashCode;

  factory ProductData.fromJson(Map<dynamic, dynamic> json) => ProductData(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        creationAt: json['creationAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt,
        "updatedAt": updatedAt,
      };
}
