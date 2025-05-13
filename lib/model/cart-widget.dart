import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imageAsset;
  final String category;
  int count;  // Make count non-final

  Product({
    required this.name,
    required this.price,
    required this.imageAsset,
    required this.category,
    this.count = 1,  // Default value is 1
  });

  Image get image => Image.asset(imageAsset);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageAsset': imageAsset,
      'category': category,
      'count': count,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      imageAsset: map['imageAsset'],
      category: map['category'] ?? 'Кофе',
      count: map['count'] ?? 1,
    );
  }
}