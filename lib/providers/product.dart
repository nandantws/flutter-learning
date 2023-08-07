import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> brandProducts = [];

  ProductProvider() {
    getProducts();
  }

  Future getProducts() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var querySnapshots = await collection.get();
    for (var queryDocumentSnapshot in querySnapshots.docs) {
      brandProducts.add(Product.fromJson(
          queryDocumentSnapshot.id, queryDocumentSnapshot.data()));
    }
  }

  // add(String image, String name) {
  //   lst.add(Products(image: image, name: name));
  //   notifyListeners();
  // }

  // del(int index) {
  //   lst.removeAt(index);
  //   notifyListeners();
  // }
}
