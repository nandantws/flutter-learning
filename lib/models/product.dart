import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/utils.dart';

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

  Product.fromJson(String productId, Map<String, dynamic> json) {
    var colorsList = List<Color>.generate(json["colors"].length,
        (int index) => hexToColor(json["colors"][index]));

    var sizesList = List<String>.from(json['sizes']);

    id = productId;
    brand = json["brand"];
    name = json["name"];
    category = json["category"];
    image = json["image"];
    colors = colorsList;
    price = json["price"];
    sizes = sizesList;
    description = json["description"];
  }

  factory Product.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Product.fromJson(documentSnapshot.id, data);
  }

  static Future<Product> getProductById(String documentId) async {
    var collection = FirebaseFirestore.instance.collection('products');
    var documentReference = collection.doc(documentId);
    var documentSnapshot = await documentReference.get();
    return Product.fromDocumentSnapshot(documentSnapshot);

    // if (documentSnapshot.exists) {
    // } else {
    //   return null; // Return null if the document does not exist
    // }
  }
}
