import 'package:flutter/material.dart';
import 'package:helloworld/models/cartItem.dart';
import 'package:helloworld/screens/cart/utils.dart';
import 'package:helloworld/screens/widgets/appbars.dart';

class CartItemsListing extends StatefulWidget {
  const CartItemsListing({Key? key}) : super(key: key);

  @override
  State<CartItemsListing> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartItemsListing> {
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    List _items = [
      {
        'id': 1,
        'product': {
          'id': 1,
          'brand': 'Puma',
          'category': "Men's Sneaker",
          'name': '1DER Vegas',
          'image': 'assets/puma.png',
          'colors': [Colors.black, Colors.red, Colors.blue],
          'price': 485,
          'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
          'description':
              "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
        },
        'quantity': 1,
        'color': 'Red',
        'size': 45
      },
      {
        'id': 2,
        'product': {
          'id': 1,
          'brand': 'Puma',
          'category': "Men's Sneaker",
          'name': '1DERS Vegas',
          'image': 'assets/puma.png',
          'colors': [Colors.black, Colors.red, Colors.blue],
          'price': 485,
          'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
          'description':
              "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
        },
        'quantity': 1,
        'color': 'Red',
        'size': 45
      },
    ];

    _cartItems =
        List.from(_items).map((item) => CartItem.fromJson(item)).toList();
  }

  updateQuantity(itemId, operation) {
    for (int i = 0; i < _cartItems.length; i++) {
      print(_cartItems[i].id);
      if (_cartItems[i].id == itemId) {
        setState(() {
          if (operation == 'add') {
            _cartItems[i].quantity += 1;
          } else {
            _cartItems[i].quantity -= 1;
          }
          if (_cartItems[i].quantity == 0) {
            _cartItems.removeAt(i);
          }
        });

        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
          _cartItems.length,
          (i) => CartCard(
                cartItem: _cartItems[i],
                handleQuantityUpdate: updateQuantity,
              ))
    ]);
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppbar(),
      body: Column(
        children: [CartItemsListing()],
      ),
    );
    //     return Scaffold(
    //   appBar: const CartAppbar(),
    //   body: Column(
    //     children: [Text('data')],
    //   ),
    // );
  }
}
