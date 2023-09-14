import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.notifications_none_rounded,
          size: 30,
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            height: 10,
            width: 10,
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            height: 10,
            width: 10,
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
