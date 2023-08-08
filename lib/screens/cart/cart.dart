import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';
import 'package:helloworld/screens/cart/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class CartItemsListing extends StatelessWidget {
  const CartItemsListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return productProvider.cartItems.isNotEmpty
        ? Column(children: [
            ...List.generate(
                productProvider.cartItems.length,
                (i) => CartCard(
                      cartItem: productProvider.cartItems[i],
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
