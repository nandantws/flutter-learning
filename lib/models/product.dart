import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String brand;
  late final String category;
  late final String name;
  late final String image;
  late final List<Color> colors;
  late final int price;
  late final List<String> sizes;
  late final String description;

  Product(
      {required this.id,
      required this.brand,
      required this.name,
      required this.image,
      required this.colors,
      required this.price,
      required this.category,
      required this.sizes,
      required this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    brand = json["brand"];
    name = json["name"];
    category = json["category"];
    image = json["image"];
    colors = json["colors"];
    price = json["price"];
    sizes = json["sizes"];
    description = json["description"];
  }
}
