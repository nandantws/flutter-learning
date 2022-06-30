import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/appbar.dart';
import 'package:helloworld/screens/home/banner.dart';
import 'package:helloworld/screens/home/bottomNavigationBar.dart';
import 'package:helloworld/screens/home/categories.dart';
import 'package:helloworld/screens/home/utils.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: CustomAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              color: Color(0xFFF8F8F8),
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
        )
        // bottomNavigationBar: BottomNavigationBar(
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     items: [
        //       BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        //       BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        //       BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ''),
        //     ]),
        );
  }
}
