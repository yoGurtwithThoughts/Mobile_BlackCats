import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imageAsset;

  Product({
    required this.name,
    required this.price,
    required this.imageAsset,
  });

  // Геттер для получения виджета изображения
  Image get image => Image.asset(imageAsset);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageAsset': imageAsset,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      imageAsset: map['imageAsset'],
    );
  }
}