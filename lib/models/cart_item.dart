import 'package:helloworld/models/product.dart';

class CartItem {
  late final int id;
  late int quantity;
  late final String color;
  late final int size;
  late final Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.color,
    required this.size,
    required this.product,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    quantity = json["quantity"];
    color = json["color"];
    size = json["size"];
    product = Product.fromJson(json["product"]);
  }
}
