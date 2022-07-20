import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String brand;
  late final String category;
  late final String name;
  late final String image;
  late final List<Color> colors;
  late final int price;

  Product(this.id, this.brand, this.name, this.image, this.colors, this.price,
      this.category);

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    brand = json["brand"];
    name = json["name"];
    category = json["category"];
    image = json["image"];
    colors = json["colors"];
    price = json["price"];
  }
}
