import "dart:math" show pi;
import 'package:flutter/material.dart';

import 'package:helloworld/models/cart_item.dart';
import 'package:helloworld/providers/product.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:provider/provider.dart';
import '../detail/utils.dart';

class CartCard extends StatelessWidget {
  CartItem cartItem;
  CartCard({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
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
                const Spacer(),
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
                          bottom: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Size : ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              cartItem.size,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              "Color:",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            ColorCircle(color: cartItem.color, selected: false),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => productProvider.updateQuantity(
                                    cartItem.id, 'remove'),
                                icon: cartItem.quantity == 1
                                    ? const Icon(Icons.delete)
                                    : const Icon(Icons.remove)),
                            Text("${cartItem.quantity}"),
                            IconButton(
                                onPressed: () => productProvider.updateQuantity(
                                    cartItem.id, 'add'),
                                icon: const Icon(Icons.add)),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
