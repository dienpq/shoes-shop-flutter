import 'package:app_shoes__shop/controllers/cart_controller.dart';
import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:app_shoes__shop/pages/components/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
        backgroundColor: widget.product.color,
        elevation: 0,
        title: const Text("DETAILS"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(FlutterIcons.leftOpen1)),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
                bottom: 0,
                child: SizedBox(
                  height: size.height * .75,
                  width: size.width,
                  child: ClipPath(
                    clipper: AppClipper(
                        cornerSize: 50,
                        diagonalHeight: 180,
                        roundedBottom: false),
                    child: Container(
                      color: Colors.white,
                      padding:
                          const EdgeInsets.only(top: 180, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildRating(),
                          const SizedBox(height: 24),
                          const Text(
                            "DETAILS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            widget.product.desc,
                            style: const TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "COLOR OPTIONS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              _buildColorOption(blueColor),
                              _buildColorOption(greenColor),
                              _buildColorOption(orangeColor),
                              _buildColorOption(redColor),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Hero(
                tag: "hero${widget.product.imagePath}",
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image(
                    width: MediaQuery.of(context).size.width * .85,
                    image: AssetImage(widget.product.imagePath),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "PRICE",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                "\$${widget.product.price.toInt()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          Hero(
            tag: 'add',
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  onClickAdd(-1);
                },
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[
        RatingBar.builder(
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(width: 16),
        const Text(
          "134 Reviews",
          style: TextStyle(
            color: Colors.black26,
          ),
        )
      ],
    );
  }

  void onClickAdd(index) {
    bool isExisted = false;
    int indexExistedProduct = -1;
    for (int i = 0; i < cartController.itemsCartTest.length; i++) {
      CartItemModel itemCart = cartController.itemsCartTest[i];
      if (itemCart.product.getId == widget.product.getId) {
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
      cartController.itemsCartTest.add(CartItemModel(widget.product, 1));
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
