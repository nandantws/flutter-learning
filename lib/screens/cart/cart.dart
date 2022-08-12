import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';
import '../detail/utils.dart';
import '../widgets/appbars.dart';
import "dart:math" show pi;

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: CartAppbar(),
        body: Column(children: [
          Container(
            color: const Color.fromARGB(131, 236, 229, 227),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 3,
                      child: Card(
                        child: Transform.rotate(
                          angle: -(pi / 9),
                          child: Image.asset(
                            'assets/puma.png',
                            height: 100,
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyText(
                              text: "Men's Sneakers",
                            ),
                            SubHeading(
                              text: 'Nike Air Pegasus',
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
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Card(
                          elevation: 2,
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          )))
                ],
              ),
            ),
          )
        ]));
  }
}
