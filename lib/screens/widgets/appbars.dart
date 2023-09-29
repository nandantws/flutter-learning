import 'package:flutter/material.dart';
import 'package:helloworld/providers/authentication.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:helloworld/screens/widgets/icons.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);
  @override
  Size get preferredSize {
    return const Size.fromHeight(73.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthProvider authProvider = AuthProvider();

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
              const SizedBox(
                height: 7,
              ),
              Text(
                authProvider.user?.email ?? "Guest",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
              child: const IconWithDot(
                icon: Icons.shopping_cart,
              )),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/index');
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const Text(
            'Cart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: size.width * 0.65,
          ),
        ]),
      ),
    );
  }
}
