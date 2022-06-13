import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/appbar.dart';
import 'package:helloworld/screens/home/banner.dart';
import 'package:helloworld/screens/home/categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var singleChildScrollView = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70,
            ),
            CustomAppbar(),
            SizedBox(
              height: 30,
            ),
            NewProductBanner(),
            SizedBox(
              height: 20,
            ),
            Categories()
          ],
        ),
      ),
    );
    return Scaffold(
      body: singleChildScrollView,
    );
  }
}
