import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';
import 'package:helloworld/screens/cart/cart_item_card.dart';
import 'package:helloworld/screens/detail/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';
import 'package:provider/provider.dart';

import '../../handlers/authentication.dart';
import '../../providers/product.dart';
import 'empty_cart.dart';

class ItemList extends StatelessWidget {
  final List<CartItem> items;
  const ItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
          items.length,
          (i) => CartCard(
                cartItem: items[i],
              ))
    ]);
  }
}

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: const CartAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: productProvider.cartItems.isEmpty
              ? const EmptyCart()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemList(
                      items: productProvider.cartItems,
                    ),
                    OrangeButton(
                        text: "Proceed to Checkout",
                        onPressed: () {
                          checkAuthAndRedirect(context, '/checkout');
                        })
                  ],
                ),
        ),
      ),
    );
  }
}
