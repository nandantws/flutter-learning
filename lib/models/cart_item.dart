import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:helloworld/models/product.dart';
import 'package:helloworld/models/utils.dart';

class CartItem {
  late final String id;
  late int quantity;
  late final Color color;
  late final String size;
  late Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.color,
    required this.size,
    required this.product,
  });

  static Future<CartItem> fromJson(Map<String, dynamic> json) async {
    return CartItem(
      id: json["id"],
      quantity: json["quantity"],
      color: hexToColor(json["color"]),
      size: json["size"],
      product: await Product.getProductById(json["product"]),
    );
  }

  // Function to convert a list of CartItem objects to JSON
  static List<Map<String, dynamic>> cartItemsListToJson(
      List<CartItem> cartItems) {
    List<Map<String, dynamic>> jsonList = [];
    for (var cartItem in cartItems) {
      jsonList.add(cartItem.toJson());
    }
    return jsonList;
  }

  // Function to convert the CartItem object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'color': color.value.toRadixString(16),
      'size': size,
      'product': product.id,
    };
  }

  static Future<List<CartItem>> cartItemsListFromJson(
      List<dynamic> jsonList) async {
    List<CartItem> cartItems = [];
    for (var obj in jsonList) {
      final cartItem = await CartItem.fromJson(obj);
      cartItems.add(cartItem);
    }
    return cartItems;
  }
}
