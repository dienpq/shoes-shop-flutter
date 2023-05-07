import 'package:app_shoes__shop/controllers/cart_controller.dart';
import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/pages/detail_page.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class ListProductsWidget extends StatefulWidget {
  final List<ProductModel> displayProducts;
  const ListProductsWidget({Key? key, required this.displayProducts})
      : super(key: key);

  @override
  State<ListProductsWidget> createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProductsWidget> {
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        children: List.generate(widget.displayProducts.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      DetailPage(product: widget.displayProducts[index])));
            },
            child: Container(
              // height: size.width/2 + 50,
              width: (size.width - 60) / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: (size.width - 160) / 2,
                    // width: (size.width - 80) / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Hero(
                      tag: "hero${widget.displayProducts[index].imagePath}",
                      child: Image(
                        image: AssetImage(
                            widget.displayProducts[index].getImageUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32,
                          child: Center(
                            child: Text(
                              "${widget.displayProducts[index].getName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              itemSize: 20,
                              initialRating: 4,
                              minRating: 1,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sold ${widget.displayProducts[index].soldNum}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  children: [
                                    Text(
                                      "\$${widget.displayProducts[index].getPrice}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    const SizedBox(width: 2),
                                    (widget.displayProducts[index].discount !=
                                            0)
                                        ? Container(
                                            padding: const EdgeInsets.only(
                                                top: 0.5,
                                                bottom: 0.5,
                                                right: 1,
                                                left: 1.5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.red)),
                                            child: Text(
                                              '-${widget.displayProducts[index].discount.toString()}%',
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 11,
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                onClickAdd(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Hero(
                                  tag: "add",
                                  child: Stack(children: [
                                    Transform.rotate(
                                        angle: -math.pi / 4.0,
                                        child: Container(
                                          width: size.width / 9.5,
                                          height: size.width / 9.5,
                                          decoration: BoxDecoration(
                                              color:
                                                  primaryColor.withOpacity(0.9),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        )),
                                    const Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Icon(Icons.add,
                                            color: Colors.white))
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }

  void onClickAdd(index) {
    bool isExisted = false;
    int indexExistedProduct = -1;
    for (int i = 0; i < cartController.itemsCartTest.length; i++) {
      CartItemModel itemCart = cartController.itemsCartTest[i];
      if (itemCart.product.getId == widget.displayProducts[index].getId) {
        isExisted = true;
        indexExistedProduct = i;
        break;
      }
    }

    if (isExisted) {
      CartItemModel temporaryCartItem =
          cartController.itemsCartTest[indexExistedProduct];
      temporaryCartItem.quantity += 1;
      cartController.itemsCartTest[indexExistedProduct] = temporaryCartItem;
    } else {
      cartController.itemsCartTest
          .add(CartItemModel(widget.displayProducts[index], 1));
    }

    // Show snack bar
    const snackBar = SnackBar(
      content: Text('Added 1 product'),
      duration: Duration(seconds: 1),
      backgroundColor: Color.fromARGB(221, 0, 114, 82),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
