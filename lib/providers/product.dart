import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> brandProducts = [];
  List<CartItem> cartItems = [];

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
    notifyListeners();
  }

  addToCart(String productId, String size, Color color) {
    Product product =
        brandProducts.firstWhere((element) => element.id == productId);

    bool isAlreadyInCart = cartItems.any((item) =>
        item.product.id == product.id &&
        item.size == size &&
        item.color == color);

    if (!isAlreadyInCart) {
      cartItems.add(CartItem(
          id: "1", quantity: 1, size: size, color: color, product: product));
    } else {
      CartItem existingItem = cartItems.firstWhere((item) =>
          item.product.id == product.id &&
          item.size == size &&
          item.color == color);

      // Increase the quantity of the existing item
      existingItem.quantity++;
    }

    notifyListeners();
  }
}
