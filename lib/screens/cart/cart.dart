import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';
import 'package:helloworld/screens/cart/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class CartItemsListing extends StatelessWidget {
  const CartItemsListing({Key? key}) : super(key: key);

  // List cartItems = [];
  //   updateQuantity(itemId, operation) {
  //   for (int i = 0; i < cartItems.length; i++) {
  //     // print(_cartItems[i].id);
  //     if (cartItems[i].id == itemId) {
  //       setState(() {
  //         if (operation == 'add') {
  //           cartItems[i].quantity += 1;
  //         } else {
  //           cartItems[i].quantity -= 1;
  //         }
  //         if (cartItems[i].quantity == 0) {
  //           cartItems.removeAt(i);
  //         }
  //       });

  //       break;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return productProvider.cartItems.isNotEmpty
        ? Column(children: [
            ...List.generate(
                productProvider.cartItems.length,
                (i) => CartCard(
                      cartItem: productProvider.cartItems[i],
                      handleQuantityUpdate: () => {},
                    ))
          ])
        : const Center(child: CircularProgressIndicator());
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartAppbar(),
      body: Column(
        children: [CartItemsListing()],
      ),
    );
  }
}
