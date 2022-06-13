import 'package:flutter/material.dart';
import "dart:math" show pi;

class NewProductBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: _size.height * 0.19,
          width: _size.width,
          decoration: BoxDecoration(
              // color: Colors.orange,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFF58524),
                  Color(0xFFF2923E),
                  Color(0xFFF6A656),
                ],
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Now',
                      style: TextStyle(
                          color: Colors.black26, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Nike Go Flyease',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 17),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(120, 25)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all(Color(0xFFF2923E)),
                    ))
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Transform.rotate(
            angle: -(pi / 5),
            child: Image.asset(
              'assets/landing.png',
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
