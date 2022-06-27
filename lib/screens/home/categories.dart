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

  List _products = [
    {
      'category': 'Unisex Shoes',
      'name': 'Balenciaga Speed',
      'image': 'assets/balenciaga.png',
      'colors': [Colors.black, Colors.cyan, Colors.teal],
      'price': 485,
    },
    {
      'category': "Men's Shoes",
      'name': 'Nike Zoom Freak',
      'image': 'assets/nike.png',
      'colors': [Colors.black, Colors.green],
      'price': 485,
    },
    {
      'category': "Men's Sneaker",
      'name': '1DER Vegas',
      'image': 'assets/puma.png',
      'colors': [Colors.black, Colors.red, Colors.blue],
      'price': 485,
    },
    {
      'category': 'Running Shoes',
      'name': 'ADISTEN M',
      'image': 'assets/adidas.png',
      'colors': [Colors.black, Colors.blueAccent, Colors.grey],
      'price': 485,
    },
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
                childAspectRatio: 0.624,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  ...List.generate(
                      _products.length,
                      (i) => ProductCard(
                            category: _products[i]['category'],
                            name: _products[i]['name'],
                            image: _products[i]['image'],
                            colors: _products[i]['colors'],
                            price: _products[i]['price'],
                          )),
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
