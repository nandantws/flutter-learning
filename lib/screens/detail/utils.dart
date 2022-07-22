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
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(right: 5),
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

class SizeChip extends StatelessWidget {
  bool isSelected;
  String text;

  SizeChip({required this.text, this.isSelected = false});
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
          padding: const EdgeInsets.all(8.0),
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
