import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

const uuid = Uuid();

class ProductProvider with ChangeNotifier {
  final List<Product> brandProducts = [];
  List<CartItem> cartItems = [];
  late SharedPreferences _prefs;

  ProductProvider() {
    getProducts();
    initPrefs();
  }

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
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

  void getCartItems() async {
    String? jsonString = _prefs.getString('cartItems');

    if (jsonString != null) {
      var decodedData = json.decode(jsonString);
      cartItems = await CartItem.cartItemsListFromJson(decodedData);
      notifyListeners();
    }
  }

  void saveCartItems() async {
    _prefs.setString(
        'cartItems', json.encode(CartItem.cartItemsListToJson(cartItems)));
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
          id: uuid.v4(),
          quantity: 1,
          size: size,
          color: color,
          product: product));
    } else {
      CartItem existingItem = cartItems.firstWhere((item) =>
          item.product.id == product.id &&
          item.size == size &&
          item.color == color);

      existingItem.quantity++;
    }
    saveCartItems();
    notifyListeners();
  }

  updateQuantity(itemId, operation) {
    CartItem cartItem = cartItems.firstWhere((item) => item.id == itemId);
    if (operation == 'add') {
      cartItem.quantity++;
    } else {
      cartItem.quantity--;
    }
    if (cartItem.quantity == 0) {
      cartItems.remove(cartItem);
    }
    notifyListeners();
  }
}
