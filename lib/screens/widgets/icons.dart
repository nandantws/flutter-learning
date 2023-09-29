import 'package:flutter/material.dart';

class IconWithDot extends StatelessWidget {
  final IconData icon;
  const IconWithDot({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            height: 10,
            width: 10,
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
