import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/banner.dart';
import 'package:helloworld/screens/home/categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: const Color(0xFFF8F8F8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              NewProductBanner(),
              SizedBox(
                height: 20,
              ),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }
}
