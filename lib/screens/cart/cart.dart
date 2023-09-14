import 'package:flutter/material.dart';
import 'package:helloworld/screens/cart/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class CartItemsListing extends StatefulWidget {
  const CartItemsListing({Key? key}) : super(key: key);

  @override
  State<CartItemsListing> createState() => _CartItemsListingState();
}

class _CartItemsListingState extends State<CartItemsListing> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getCartItems();
  }

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
        : const Center(child: Text("No Items in the Cart"));
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
