import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final controller;
  final bool obscureText;

  const TextInputField(
      {super.key,
      required this.label,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            obscureText: obscureText,
          )
        ],
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  // final String imagePath;
  const SquareTile({
    super.key,
    // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      // child: Image.asset(
      //   imagePath,
      //   height: 40,
      // ),
    );
  }
}
