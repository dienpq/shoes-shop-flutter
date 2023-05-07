// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:app_shoes__shop/pages/detail_page.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:app_shoes__shop/pages/components/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CategoryItemsPage extends StatefulWidget {
  String brand;
  CategoryItemsPage({Key? key, required this.brand}) : super(key: key);

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  var filteredList = [];
  @override
  Widget build(BuildContext context) {
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
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: getBodyHome(),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(FlutterIcons.search, color: Colors.black26))
            ],
          ),
        ),
        getItemPoster(),
        SizedBox(
          height: 16,
        ),
        Padding(
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
                style: TextStyle(color: greenColor, fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        ...filteredList.map((data) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailPage(product: data)));
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
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
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "${data.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${data.brand}",
                            style: TextStyle(
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
                        style: TextStyle(
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
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: filteredList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16),
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
                margin: EdgeInsets.only(right: 16),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25),
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
        color: filteredList[index].color,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
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
                  Expanded(child: SizedBox()),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    // width: 125,
                    child: Text(
                      "${filteredList[index].name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$${filteredList[index].price}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
