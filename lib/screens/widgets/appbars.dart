import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:helloworld/screens/widgets/utils.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppbar({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;
  @override
  Size get preferredSize {
    return const Size.fromHeight(73.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? displayName = user?.email ?? "Guest";

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06, vertical: size.height * 0.015),
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
                displayName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/cart',
              );
            },
            child: CartIcon(),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout),
          ),
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(children: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios)),
        Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: size.width * 0.65,
        ),
        // NotificationIcon()
      ]),
    );
  }
}
