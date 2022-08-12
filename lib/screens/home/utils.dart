import 'package:flutter/material.dart';
import "dart:math" show pi;

import 'package:helloworld/models/product.dart';
import 'package:helloworld/screens/detail/detail.dart';

class GreyText extends StatelessWidget {
  String text;

  GreyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black26,
        fontSize: 15,
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  bool isSelected;
  String text;

  CategoryChip({required this.text, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF2923E),
                      Color(0xFFF6A656),
                    ]))
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.black26,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class ColorDots extends StatelessWidget {
  // bool isSelected;
  List colors;
  ColorDots({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(
          colors.length,
          (i) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration:
                      BoxDecoration(color: colors[i], shape: BoxShape.circle),
                ),
              ))
    ]);
  }
}

class ProductCard extends StatelessWidget {
  Product product;

  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(product: product)));
      },
      child: Hero(
        tag: Key(product.id.toString()),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _size.height * 0.02,
                      ),
                      GreyText(text: product.category),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      SizedBox(
                        height: _size.height * 0.065,
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontSize: _size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: _size.height * 0.15,
                        child: Transform.rotate(
                            angle: -(pi / 9),
                            child: Image.asset(product.image)),
                      ),
                      SizedBox(
                        height: _size.height * 0.02,
                      ),
                      ColorDots(
                        colors: product.colors,
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$' + product.price.toString(),
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )
                          ])
                    ],
                  ),
                ),
              ]),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: _size.height * 0.055,
                  width: _size.width * 0.11,

                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: _size.width * 0.07,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFF58524),
                          Color(0xFFF2923E),
                          Color(0xFFF6A656),
                        ],
                      ),
                      // color: Colors.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  // width: ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
