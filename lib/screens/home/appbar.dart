import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.indigo,
      child: Row(children: [
        Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreyText(text: "Welcome Back"),
              SizedBox(
                height: 7,
              ),
              Text(
                'Yoru Fernandes!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(width: 170),
        Stack(
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 30,
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                height: 10,
                width: 10,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            )
          ],
        )
      ]),
    );
  }
}
