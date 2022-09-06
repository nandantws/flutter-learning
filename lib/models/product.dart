import 'package:flutter/material.dart';

class Product {
  late final String id;
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
    var _colors = List<Color>.generate(json["colors"].length,
        (int index) => hexToColor(json["colors"][index]));

    var _sizes = List<String>.from(json['sizes']);

    id = json["id"];
    brand = json["brand"];
    name = json["name"];
    category = json["category"];
    image = json["image"];
    colors = _colors;
    price = json["price"];
    sizes = _sizes;
    description = json["description"];
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
