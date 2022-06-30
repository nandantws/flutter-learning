import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(72.0);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _size.width * 0.06, vertical: _size.height * 0.015),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
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
      ),
    );
  }
}
