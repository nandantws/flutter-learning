import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/productListing.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:helloworld/models/product.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late TabController tabController;
  List _categories = [
    'All',
    'Nike',
    'Addidas',
    'Puma',
  ];
  int selectedIndex = 0;
  List<Product> _brandProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    List _products = [
      {
        'id': 1,
        'brand': 'Puma',
        'category': "Men's Sneaker",
        'name': '1DER Vegas',
        'image': 'assets/puma.png',
        'colors': [Colors.black, Colors.red, Colors.blue],
        'price': 485,
      },
      {
        'id': 2,
        'brand': 'Addidas',
        'category': 'Running Shoes',
        'name': 'ADISTEN M',
        'image': 'assets/adidas.png',
        'colors': [Colors.black, Colors.blueAccent, Colors.grey],
        'price': 485,
      },
      {
        'id': 3,
        'brand': 'Nike',
        'category': "Men's Shoes",
        'name': 'Nike Air Pegasus',
        'image': 'assets/nike_air_zoom_pegasus.png',
        'colors': [Colors.black, Colors.green],
        'price': 485,
      },
      {
        'id': 4,
        'brand': 'Nike',
        'category': "Men's Shoes",
        'name': 'Nike Air Presto',
        'image': 'assets/nike_air_presto.png',
        'colors': [Colors.black, Colors.green],
        'price': 485,
      },
      {
        'id': 5,
        'brand': 'Nike',
        'category': "Men's Shoes",
        'name': 'Nike Air Force',
        'image': 'assets/nike_air_force.png',
        'colors': [Colors.black, Colors.green],
        'price': 485,
      },
      {
        'id': 6,
        'brand': 'Nike',
        'category': "Men's Shoes",
        'name': 'Nike Zoom Freak',
        'image': 'assets/nike_zoom_freak.png',
        'colors': [Colors.black, Colors.green],
        'price': 485,
      }
    ];

    _brandProducts = List.from(_products)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
          height: _size.height * 0.025,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.only(right: 7),
                      indicatorColor: Colors.transparent,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      tabs: [
                        ...List.generate(
                            _categories.length,
                            (i) => Tab(
                                    child: CategoryChip(
                                  text: _categories[i],
                                  isSelected: i == selectedIndex ? true : false,
                                )))
                      ]),
                  SizedBox(
                    height: _size.height * 0.01,
                  ),
                  ProductsGridView(
                    products: _brandProducts
                        .where((product) => _categories[selectedIndex] == 'All'
                            ? true
                            : product.brand == _categories[selectedIndex])
                        .toList(),
                  )
                ],
              )),
        ),
        SizedBox(
          height: _size.height * 0.015,
        )
      ],
    );
  }
}
