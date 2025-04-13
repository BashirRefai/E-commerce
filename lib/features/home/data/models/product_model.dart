// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_f1/features/home/data/models/categories_model.dart';

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final CategoryModel categories;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.categories,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      categories: CategoryModel.fromJson(json['categories']),
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      images: List<String>.from(map['images']),
      categories: CategoryModel.fromMap(map['category']),
    );
  }

  ProductModel copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    CategoryModel? categories,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      categories: categories ?? this.categories,
    );
  }
}
