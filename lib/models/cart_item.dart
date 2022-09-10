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

  CartItem.fromJson(
      cartItemId, Map<String, dynamic> json, DocumentSnapshot productSnapshot) {
    id = cartItemId;
    quantity = json["quantity"];
    color = hexToColor(json["color"]);
    size = json["size"];
    product = Product.fromJson(
        productSnapshot.id, productSnapshot.data() as Map<String, dynamic>);
  }
}
