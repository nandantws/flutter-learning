import 'package:flutter/material.dart';

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
