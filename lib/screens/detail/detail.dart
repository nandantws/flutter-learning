import 'package:flutter/material.dart';
import 'package:helloworld/models/product.dart';
import 'package:helloworld/screens/detail/utils.dart';
import 'package:helloworld/screens/home/utils.dart';
import 'package:readmore/readmore.dart';
import "dart:math" show pi;

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool is_favourite = false;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  String content =
      "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper.";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: _size.height * 0.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(131, 236, 229, 227),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            )),
                        Text(
                          widget.product.category,
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              color: Color.fromARGB(255, 233, 112, 14),
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                is_favourite = !is_favourite;
                              });
                            },
                            icon: is_favourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColor,
                                    size: 27,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                  ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.05,
                  ),
                  Transform.rotate(
                    angle: -(pi / 9),
                    child: SizedBox(
                        height: _size.height * 0.2,
                        child: Image.asset(widget.product.image)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _size.height * 0.02,
                    ),
                    Heading(text: widget.product.name),
                    SubHeading(text: "Description"),
                    ReadMoreText(content,
                        textScaleFactor: _size.height * 0.0015,
                        style: TextStyle(
                            color: Colors.grey, wordSpacing: 2, height: 1.3),
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "See More",
                        trimExpandedText: "See Less",
                        moreStyle: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                        lessStyle: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold)),
                    SubHeading(text: "Color"),
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
                    SubHeading(text: "Size"),
                    Container(
                      height: _size.height * 0.055,
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
                      height: _size.height * 0.075,
                    )
                  ]))
        ])),
      ),
      bottomSheet: SizedBox(
        height: _size.height * 0.08,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreyText(text: 'Price'),
                  SizedBox(
                    height: 7,
                  ),
                  Heading(text: "\$" + widget.product.price.toString()),
                ],
              ),
              SizedBox(
                width: _size.width * 0.06,
              ),
              OrangeButton()
            ],
          ),
        ),
      ),
    );
  }
}
