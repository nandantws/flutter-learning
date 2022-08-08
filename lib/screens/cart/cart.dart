import 'package:flutter/material.dart';
import '../widgets/appbars.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppbar(),
      body: Text('hello'),
    );
  }
}
