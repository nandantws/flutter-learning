import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/cart_item.dart';
import 'package:helloworld/screens/cart/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';

class CartItemsListing extends StatefulWidget {
  const CartItemsListing({Key? key}) : super(key: key);

  @override
  State<CartItemsListing> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartItemsListing> {
  List cartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartItems();
  }

  Future getCartItems() async {
    var collection = FirebaseFirestore.instance.collection('cartItems');
    var querySnapshots = await collection.get();
    for (var queryDocumentSnapshot in querySnapshots.docs) {
      DocumentReference productRef = queryDocumentSnapshot.data()['product'];
      productRef.get().then((DocumentSnapshot documentSnapshot) {
        setState(() {
          cartItems.add(CartItem.fromJson(queryDocumentSnapshot.id,
              queryDocumentSnapshot.data(), documentSnapshot));
        });
      });
    }
  }

  updateQuantity(itemId, operation) {
    for (int i = 0; i < cartItems.length; i++) {
      // print(_cartItems[i].id);
      if (cartItems[i].id == itemId) {
        setState(() {
          if (operation == 'add') {
            cartItems[i].quantity += 1;
          } else {
            cartItems[i].quantity -= 1;
          }
          if (cartItems[i].quantity == 0) {
            cartItems.removeAt(i);
          }
        });

        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return cartItems.isNotEmpty
        ? Column(children: [
            ...List.generate(
                cartItems.length,
                (i) => CartCard(
                      cartItem: cartItems[i],
                      handleQuantityUpdate: updateQuantity,
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
