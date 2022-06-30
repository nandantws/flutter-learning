import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/utils.dart';

class ProductsInGridView extends StatelessWidget {
  String brand = '';
  List _products = [
    // {
    //   'brand': 'All',
    //   'category': 'Unisex Shoes',
    //   'name': 'Balenciaga Speed',
    //   'image': 'assets/balenciaga.png',
    //   'colors': [Colors.black, Colors.cyan, Colors.teal],
    //   'price': 485,
    // },
    {
      'brand': 'Puma',
      'category': "Men's Sneaker",
      'name': '1DER Vegas',
      'image': 'assets/puma.png',
      'colors': [Colors.black, Colors.red, Colors.blue],
      'price': 485,
    },
    {
      'brand': 'Addidas',
      'category': 'Running Shoes',
      'name': 'ADISTEN M',
      'image': 'assets/adidas.png',
      'colors': [Colors.black, Colors.blueAccent, Colors.grey],
      'price': 485,
    },
    {
      'brand': 'Nike',
      'category': "Men's Shoes",
      'name': 'Nike Air Pegasus',
      'image': 'assets/nike_air_zoom_pegasus.png',
      'colors': [Colors.black, Colors.green],
      'price': 485,
    },
    {
      'brand': 'Nike',
      'category': "Men's Shoes",
      'name': 'Nike Air Presto',
      'image': 'assets/nike_air_presto.png',
      'colors': [Colors.black, Colors.green],
      'price': 485,
    },
    {
      'brand': 'Nike',
      'category': "Men's Shoes",
      'name': 'Nike Air Force',
      'image': 'assets/nike_air_force.png',
      'colors': [Colors.black, Colors.green],
      'price': 485,
    },
    {
      'brand': 'Nike',
      'category': "Men's Shoes",
      'name': 'Nike Zoom Freak',
      'image': 'assets/nike_zoom_freak.png',
      'colors': [Colors.black, Colors.green],
      'price': 485,
    }
  ];

  ProductsInGridView({required this.brand});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    List _brandProducts = [];
    print(brand);
    brand == 'All'
        ? _brandProducts = _products
        : _brandProducts =
            _products.where((element) => element['brand'] == brand).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _brandProducts.length,
      padding: EdgeInsets.only(bottom: _size.height * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: _size.height * 0.015,
          crossAxisSpacing: _size.height * 0.015,
          mainAxisExtent: _size.height * 0.37,
          crossAxisCount: 2),
      itemBuilder: (_, index) {
        return ProductCard(
          category: _brandProducts[index]['category'],
          name: _brandProducts[index]['name'],
          image: _brandProducts[index]['image'],
          colors: _brandProducts[index]['colors'],
          price: _brandProducts[index]['price'],
        );
      },
    );
  }
}

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
                  ProductsInGridView(
                    brand: _categories[selectedIndex],
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
