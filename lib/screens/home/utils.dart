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
