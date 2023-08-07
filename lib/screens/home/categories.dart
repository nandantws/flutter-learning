import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/home/productListing.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late TabController tabController;
  final List _categories = ['All'];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getCategories();
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
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ProductProvider provider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
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
                      labelPadding: const EdgeInsets.only(right: 7),
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
                    products: provider.brandProducts
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
