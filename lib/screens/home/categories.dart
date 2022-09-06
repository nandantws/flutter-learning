import 'package:cloud_firestore/cloud_firestore.dart';
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
  // List _categories = [
  //   'All',
  //   'Nike',
  //   'Addidas',
  //   'Puma',
  // ];
  List _categories = ['All'];
  int selectedIndex = 0;
  List<Product> _brandProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
    loadData();
  }

  Future getCategories() async {
    var categories = [];
    var collection = FirebaseFirestore.instance.collection('categories');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      categories.add(queryDocumentSnapshot.data()['name']);
      // print(queryDocumentSnapshot.data()['name']);
    }
    setState(() {
      _categories.addAll(categories);
    });

    var products = FirebaseFirestore.instance.collection('products');
    var querySnapshots = await products.get();
    for (var queryDocumentSnapshot in querySnapshots.docs) {
      // categories.add(queryDocumentSnapshot.data()['name']);
      print(queryDocumentSnapshot.id);
      print(queryDocumentSnapshot.data());
    }
  }

  loadData() {
    List _products = [
      {
        'id': 1,
        'brand': 'Puma',
        'category': "Men's Sneaker",
        'name': '1DER Vegas',
        'image': 'assets/puma.png',
        'colors': ['#000000', '#ff0000', '#66ccff'],
        // 'colors': [Color(0xDD000000), Color(0xFFB71C1C), Color(0xFF0D47A1)],
        'price': 485,
        'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
        'description':
            "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      },
      // {
      //   'id': 2,
      //   'brand': 'Addidas',
      //   'category': 'Running Shoes',
      //   'name': 'ADISTEN M',
      //   'image': 'assets/adidas.png',
      //   'colors': [Color(0xDD000000), Colors.blueAccent, Colors.grey],
      //   'price': 485,
      //   'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
      //   'description':
      //       "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      // },
      // {
      //   'id': 3,
      //   'brand': 'Nike',
      //   'category': "Men's Shoes",
      //   'name': 'Nike Air Pegasus',
      //   'image': 'assets/nike_air_zoom_pegasus.png',
      //   'colors': [Color(0xDD000000), Colors.green],
      //   'price': 485,
      //   'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
      //   'description':
      //       "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      // },
      // {
      //   'id': 4,
      //   'brand': 'Nike',
      //   'category': "Men's Shoes",
      //   'name': 'Nike Air Presto',
      //   'image': 'assets/nike_air_presto.png',
      //   'colors': [Color(0xDD000000), Colors.green],
      //   'price': 485,
      //   'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
      //   'description':
      //       "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      // },
      // {
      //   'id': 5,
      //   'brand': 'Nike',
      //   'category': "Men's Shoes",
      //   'name': 'Nike Air Force',
      //   'image': 'assets/nike_air_force.png',
      //   'colors': [Color(0xDD000000), Colors.green],
      //   'price': 485,
      //   'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
      //   'description':
      //       "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      // },
      // {
      //   'id': 6,
      //   'brand': 'Nike',
      //   'category': "Men's Shoes",
      //   'name': 'Nike Zoom Freak',
      //   'image': 'assets/nike_zoom_freak.png',
      //   'colors': [Color(0xDD000000), Colors.green],
      //   'price': 485,
      //   'sizes': ['35', '36', '37', '38', '39', '40', '41', '42', '43', '44'],
      //   'description':
      //       "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper."
      // }
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
              length: _categories.length,
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
