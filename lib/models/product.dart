import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String brand;
  late final String name;
  late final String image;
  late final List<Color> colors;
  late final double price;

  Product(this.id, this.brand, this.name, this.image, this.colors, this.price);

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    brand = json["brand"];
    name = json["name"];
    image = json["image"];
    colors = json["colors"];
    price = json["price"];
  }
}
