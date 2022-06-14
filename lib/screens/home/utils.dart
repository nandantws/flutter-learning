import 'package:flutter/material.dart';
import "dart:math" show pi;

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
                borderRadius: BorderRadius.circular(7),
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
  List<Color> colors;
  ColorDots({required this.colors});

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
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: _size.width * 0.4,
        height: _size.height * 0.7,
        // color: Colors.teal,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _size.height * 0.02,
                ),
                GreyText(text: 'Unisex Shoes'),
                SizedBox(
                  height: _size.height * 0.01,
                ),
                Text(
                  'Balenciaga Speed',
                  style: TextStyle(
                      fontSize: _size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Transform.rotate(
                    angle: -(pi / 9), child: Image.asset('assets/nike.png')),
                SizedBox(
                  height: _size.height * 0.041,
                ),
                ColorDots(
                  colors: [Colors.black, Colors.cyan, Colors.teal],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$452',
                  style: TextStyle(
                      fontSize: _size.width * 0.06,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: _size.height * 0.062,
                  width: _size.width * 0.127,
                  // height: 50,
                  // width: 50,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: _size.width * 0.08,
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
              ],
            ),
          )
        ]),
      ),
    );
  }
}
