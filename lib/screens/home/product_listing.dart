import 'package:flutter/material.dart';
import 'package:helloworld/models/product.dart';
import 'package:helloworld/screens/home/utils.dart';

class ProductsGridView extends StatelessWidget {
  List<Product> products = [];
  ProductsGridView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: size.height * 0.015,
          crossAxisSpacing: size.height * 0.015,
          mainAxisExtent: size.height * 0.37,
          crossAxisCount: 2),
      itemBuilder: (_, index) {
        return ProductCard(
          product: products[index],
        );
      },
    );
  }
}
