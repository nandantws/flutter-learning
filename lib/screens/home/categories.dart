import 'package:flutter/material.dart';
import 'package:helloworld/providers/category.dart';
import 'package:helloworld/screens/home/product_listing.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late TabController tabController;
  // final List _categories = ['All'];
  int selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   getCategories();
  // }

  // Future getCategories() async {
  //   var categories = [];
  //   var collection = FirebaseFirestore.instance.collection('categories');
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     categories.add(queryDocumentSnapshot.data()['name']);
  //     // print(queryDocumentSnapshot.data()['name']);
  //   }
  //   setState(() {
  //     _categories.addAll(categories);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

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
          height: size.height * 0.025,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: DefaultTabController(
              length: categoryProvider.categories.length,
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
                            categoryProvider.categories.length,
                            (i) => Tab(
                                    child: CategoryChip(
                                  text: categoryProvider.categories[i],
                                  isSelected: i == selectedIndex ? true : false,
                                )))
                      ]),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  ProductsGridView(
                    products: productProvider.brandProducts
                        .where((product) =>
                            categoryProvider.categories[selectedIndex] == 'All'
                                ? true
                                : product.brand ==
                                    categoryProvider.categories[selectedIndex])
                        .toList(),
                  )
                ],
              )),
        ),
        SizedBox(
          height: size.height * 0.015,
        )
      ],
    );
  }
}
