import 'package:flutter/material.dart';
import 'package:helloworld/models/cartItem.dart';
import 'package:helloworld/screens/home/utils.dart';
import '../detail/utils.dart';
import "dart:math" show pi;

class CartCard extends StatelessWidget {
  CartItem cartItem;
  Function handleQuantityUpdate;
  CartCard(
      {Key? key, required this.cartItem, required this.handleQuantityUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(131, 236, 229, 227),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Card(
                      child: Transform.rotate(
                        angle: -(pi / 9),
                        child: Image.asset(
                          cartItem.product.image,
                          height: 100,
                        ),
                      ),
                    )),
                Spacer(),
                Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GreyText(
                          text: cartItem.product.category,
                        ),
                        SubHeading(
                          text: cartItem.product.name,
                          bottom: _size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              'Size : ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '36',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Color : ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Blue',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  handleQuantityUpdate(cartItem.id, 'remove');
                                },
                                icon: cartItem.quantity == 1
                                    ? Icon(Icons.delete)
                                    : Icon(Icons.remove)),
                            Text("${cartItem.quantity}"),
                            IconButton(
                                onPressed: () {
                                  handleQuantityUpdate(cartItem.id, 'add');
                                },
                                icon: Icon(Icons.add)),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
