import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/pages/detail_page.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:app_shoes__shop/pages/components/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CategoryItemsPage extends StatefulWidget {
  final String brand;
  const CategoryItemsPage({Key? key, required this.brand}) : super(key: key);

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  var filteredList = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          filteredList = products
              .where((product) => product.brand == widget.brand.toLowerCase())
              .toList();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            body: getBodyHome(),
          );
        } else if (snapshot.hasError) {
          return const Text('Failed to fetch products');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget getBodyHome() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.brand,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FlutterIcons.search, color: Colors.black26))
            ],
          ),
        ),
        getItemPoster(),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "JUST FOR YOU",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              Text(
                "VIEW ALL",
                style: TextStyle(color: ColorUtils.greenColor, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ...filteredList.map((data) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailPage(product: data)));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("${data.imagePath}"),
                      width: 100,
                      height: 60,
                      // fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "${data.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${data.brand}",
                            style: const TextStyle(
                              color: Colors.black26,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "\$${data.price.toInt()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ));
        })
      ],
    );
  }

  Widget getItemPoster() {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: filteredList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailPage(
                          product: filteredList[index],
                        )));
              },
              child: Container(
                width: 230,
                margin: const EdgeInsets.only(right: 16),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: _buildBackground(index, 230, filteredList),
                    ),
                    Positioned(
                        bottom: 130,
                        right: 10,
                        child: Hero(
                            tag: "hero${filteredList[index].imagePath}",
                            child: Transform.rotate(
                              angle: -math.pi / 7,
                              child: Image(
                                  width: 220,
                                  // height: 150,
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      "${filteredList[index].imagePath}")),
                            )))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildBackground(int index, double width, filteredList) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: getColorFromHex(filteredList[index].color),
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Icon(
                      filteredList[index].brand == "Nike"
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    // width: 125,
                    child: Text(
                      "${filteredList[index].name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${filteredList[index].price}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
