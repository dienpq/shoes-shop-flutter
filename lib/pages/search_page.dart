import 'package:app_shoes__shop/controllers/search_controller.dart';
import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/pages/components/list_products_widget.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:app_shoes__shop/pages/components/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  var searchController = Get.put(SearchController());
  bool isNavigatorCall = false;
  final textController = TextEditingController();

  SearchPage({Key? key, required this.isNavigatorCall}) : super(key: key);

  void _runFilter(String keyword) {
    List<ProductModel> results = [];
    if (keyword.isEmpty) {
      results = products;
    } else {
      results = products
          .where((product) => product.getName
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    }

    searchController.foundProducts.value = results;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(size, context),
    );
  }

  Widget getBody(size, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 16),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          (isNavigatorCall) ? getHeader(size) : Container(),
          getSearchBar(context),
          getResultRow(),
          const SizedBox(height: 20),
          getResultProducts(size, context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget getHeader(size) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            FlutterIcons.menu,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Search",
                style: TextStyle(
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
        ],
      ),
    );
  }

  Widget getSearchBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          // SizedBox(width: 5),
          (!isNavigatorCall)
              ? GestureDetector(
                  onTap: () {
                    searchController.keywordSearch.value = '';
                    searchController.foundProducts.value = products;
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.arrow_back_ios),
                  ))
              : Container(),
          // SizedBox(width: 5),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                onChanged: (value) {
                  searchController.keywordSearch.value = value;
                  _runFilter(value);
                },
                controller: textController,
                textInputAction: TextInputAction.done,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: primaryBgColor,
                    // iconColor: Colors.black,
                    prefixIconColor: Colors.black,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // return _runFilter(textController.text);
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black54,
                        // size: 18,
                      ),
                    ),
                    hintText: "Type your keyword"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getResultRow() {
    return Obx(() => Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 25, bottom: 10, right: 25),
        child: (searchController.keywordSearch.value.isNotEmpty)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Results for "${searchController.keywordSearch.value}"',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // ignore: invalid_use_of_protected_member
                  Text('${searchController.foundProducts.value.length} found',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sale of the month',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  BannerSlider(imgList: imgListBannerCategory),
                  const SizedBox(height: 20),
                  const Text(
                    'Recent Searched Products',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )));
  }

  Widget getResultProducts(size, context) {
    return Expanded(
      // ignore: invalid_use_of_protected_member
      child: Obx(() => (searchController.foundProducts.value.isNotEmpty)
          ? Center(
              child: ListProductsWidget(
                  // ignore: invalid_use_of_protected_member
                  displayProducts: searchController.foundProducts.value))
          : Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 2,
                    height: size.height / 4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/ic_not_found.png'))),
                  ),
                  const Text('Not Found',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: size.width / 1.5,
                    child: const Text(
                        'Sorry, the keyword you entered cannot be found. Please check again or search with another keyword.',
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            )),
    );
  }
}
