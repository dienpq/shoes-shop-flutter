import 'package:app_shoes__shop/pages/components/list_products_widget.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:app_shoes__shop/pages/components/banner_slider.dart';
import 'package:flutter/material.dart';

class SeeMorePage extends StatelessWidget {
  final String category;
  const SeeMorePage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                category,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black),
              ),
              Container(
                width: size.width / 5,
                padding: EdgeInsets.only(left: size.width / 5 * 0.1),
                color: primaryColor,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(FlutterIcons.search, color: primaryBgColor)),
              )
            ],
          ),
        ),
        Column(children: [
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 25),
              width: double.maxFinite,
              child: Text(
                'Style for today',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.6)),
              )),
          const SizedBox(height: 20),
          BannerSlider(imgList: imgListBannerSeeMore),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  '$category Products',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black.withOpacity(0.6)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListProductsWidget(displayProducts: products),
          const SizedBox(height: 30),
        ])
      ],
    );
  }
}
