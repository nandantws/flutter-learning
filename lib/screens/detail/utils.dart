import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  String text;
  SubHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double top = _size.height * 0.02;
    double bottom = _size.height * 0.01;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      child: Text(
        text,
        textScaleFactor: _size.height * 0.0016,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  Color color;
  bool selected;
  ColorCircle({Key? key, required this.color, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(right: 7),
      height: _size.height * 0.035,
      width: _size.height * 0.035,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? Color(0xFFF05A22) : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: DecoratedBox(
          decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      )),
    );
  }
}
