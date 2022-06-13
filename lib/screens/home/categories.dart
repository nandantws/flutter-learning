import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GreyText(text: 'See All')
          ],
        )
      ],
    );
  }
}
