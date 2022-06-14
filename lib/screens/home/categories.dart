import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin {
  late TabController tabController;
  List _categories = [
    'All',
    'Nike',
    'Addidas',
    'Puma',
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _categories.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GreyText(text: 'See All')
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            indicator: BoxDecoration(color: Colors.transparent),
            tabs: [
              ...List.generate(
                  _categories.length,
                  (i) => Tab(
                          child: CategoryChip(
                        text: _categories[i],
                        isSelected: i == selectedIndex ? true : false,
                      )))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: [
              Container(
                  // color: Colors.red,
                  child: GridView.count(
                padding: EdgeInsets.zero,
                childAspectRatio: 0.605,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard()
                ],
              )),
              Container(
                height: 300,
                color: Colors.teal,
              ),
              Container(
                height: 300,
                color: Colors.red,
              ),
              Container(
                height: 300,
                color: Colors.teal,
              )
            ],
          ),
        )
      ],
    );
  }
}
