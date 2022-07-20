import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _size.height * 0.6,
          child: Container(
            color: Colors.amber[50],
          ),
        ),
      ],
    );
  }
}
