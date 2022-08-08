import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:helloworld/screens/widgets/utils.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(73.0);
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
          NotificationIcon()
        ]),
      ),
    );
  }
}

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(73.0);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: _size.width * 0.65,
        ),
        NotificationIcon()
      ]),
    );
  }
}
