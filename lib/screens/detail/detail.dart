import 'package:flutter/material.dart';
import 'package:helloworld/models/product.dart';
import 'package:helloworld/screens/detail/utils.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import "dart:math" show pi;

import '../../providers/product.dart';
import '../cart/cart.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isFavourite = false;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: const Color.fromARGB(131, 236, 229, 227),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            )),
                        Text(
                          widget.product.category,
                          textScaleFactor: 1.3,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 233, 112, 14),
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                            icon: isFavourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColor,
                                    size: 27,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                  ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Hero(
                    tag: Key(widget.product.id.toString()),
                    child: Transform.rotate(
                      angle: -(pi / 9),
                      child: SizedBox(
                          height: size.height * 0.2,
                          child: Image.asset(widget.product.image)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Heading(text: widget.product.name),
                    SubHeading(
                      text: "Description",
                      top: size.height * 0.02,
                      bottom: size.height * 0.01,
                    ),
                    ReadMoreText(widget.product.description,
                        textScaleFactor: size.height * 0.0015,
                        style: const TextStyle(
                            color: Colors.grey, wordSpacing: 2, height: 1.3),
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "See More",
                        trimExpandedText: "See Less",
                        moreStyle: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                        lessStyle: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold)),
                    SubHeading(
                      text: "Color",
                      top: size.height * 0.02,
                      bottom: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            widget.product.colors.length,
                            (i) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColorIndex = i;
                                    });
                                  },
                                  child: ColorCircle(
                                    color: widget.product.colors[i],
                                    selected:
                                        i == selectedColorIndex ? true : false,
                                  ),
                                )),
                      ],
                    ),
                    SubHeading(
                      text: "Size",
                      top: size.height * 0.02,
                      bottom: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.055,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              widget.product.sizes.length,
                              (i) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSizeIndex = i;
                                    });
                                  },
                                  child: SizeChip(
                                    text: widget.product.sizes[i],
                                    isSelected: i == selectedSizeIndex,
                                  )))),
                    ),
                    SizedBox(
                      height: size.height * 0.085,
                    )
                  ]))
        ])),
      ),
      bottomSheet: SizedBox(
        height: size.height * 0.08,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreyText(text: 'Price'),
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  Heading(text: "\$${widget.product.price}"),
                ],
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              OrangeButton(
                text: 'Add to Cart',
                onPressed: () {
                  productProvider.addToCart(
                      widget.product.id,
                      widget.product.sizes[selectedSizeIndex],
                      widget.product.colors[selectedColorIndex]);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
