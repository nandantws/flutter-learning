import 'package:flutter/material.dart';
import 'package:helloworld/models/product.dart';
import 'package:helloworld/screens/home/utils.dart';

class ProductsGridView extends StatelessWidget {
  List<Product> products = [];
  ProductsGridView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: EdgeInsets.only(bottom: _size.height * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: _size.height * 0.015,
          crossAxisSpacing: _size.height * 0.015,
          mainAxisExtent: _size.height * 0.37,
          crossAxisCount: 2),
      itemBuilder: (_, index) {
        return ProductCard(
          category: products[index].category,
          name: products[index].name,
          image: products[index].image,
          colors: products[index].colors,
          price: products[index].price,
        );
      },
    );
  }
}
