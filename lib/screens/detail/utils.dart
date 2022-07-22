import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      textScaleFactor: size.height * 0.0025,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String text;
  const SubHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double top = size.height * 0.02;
    double bottom = size.height * 0.01;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      child: Text(
        text,
        textScaleFactor: size.height * 0.0016,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;
  final bool selected;
  const ColorCircle({Key? key, required this.color, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(1.5),
      margin: const EdgeInsets.only(right: 5),
      height: size.height * 0.035,
      width: size.height * 0.035,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? const Color(0xFFF05A22) : Colors.transparent,
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
  final bool isSelected;
  final String text;

  const SizeChip({Key? key, required this.text, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF2923E),
                      Color(0xFFF6A656),
                    ]))
            : null,
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.01),
          child: Text(
            text,
            textScaleFactor: 1.3,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black26,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class OrangeButton extends StatelessWidget {
  final String text;
  const OrangeButton({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        elevation: 5,
      ),
      onPressed: () {},
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFF58524),
                Color(0xFFF2923E),
                Color(0xFFF6A656),
              ],
            )),
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(minWidth: size.width * 0.67),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
