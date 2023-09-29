import 'package:flutter/material.dart';
import "dart:math" show pi;

class NewProductBanner extends StatelessWidget {
  const NewProductBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.19,
          width: size.width,
          decoration: BoxDecoration(
              // color: Colors.orange,
              gradient: const LinearGradient(
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
                const SizedBox(height: 25),
                const Column(
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
                const SizedBox(height: 12),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      fixedSize: MaterialStateProperty.all(const Size(120, 25)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all(const Color(0xFFF2923E)),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 17),
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
