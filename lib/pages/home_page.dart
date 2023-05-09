import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/pages/components/list_products_widget.dart';
import 'package:app_shoes__shop/pages/notification_page.dart';
import 'package:app_shoes__shop/pages/search_page.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/pages/components/banner_slider.dart';
import 'package:app_shoes__shop/pages/components/title_category_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: getBodyHome(size),
      ),
    );
  }

  Widget getBodyHome(size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView(
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          getHeader(),
          // SizedBox(height: 10),
          getSearchBar(),
          const SizedBox(height: 10),
          Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  getBannerSlider(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 12),
                    child: Divider(),
                  ),
                  getUtilities(size),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 12),
                    child: Divider(),
                  ),
                  getItemsProduct(size),
                  const SizedBox(height: 30),
                ],
              )),
        ],
      ),
    );
  }

  Widget getHeader() {
    return Container(
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(
                            children: [
                          TextSpan(
                              text: "FREESHIP",
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                              text: "+",
                              style: TextStyle(color: Colors.yellow)),
                        ],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic))),
                  ],
                ),
              ),
              Align(
                  child: Stack(
                children: [
                  const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.trending_up_outlined,
                        color: Colors.red,
                        size: 40,
                      )),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "TuHi",
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: "Shoes",
                            style: TextStyle(
                                color: Color.fromARGB(255, 250, 231, 64),
                                fontStyle: FontStyle.italic)),
                      ])),
                ],
              )),
              Positioned(
                  right: 5,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const NotificationPage()));
                    },
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ));
  }

  Widget getSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        readOnly: true,
        onTap: () {
          Navigator.of(context).push(
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: SearchPage(isNavigatorCall: false),
                inheritTheme: true,
                ctx: context),
          );
        },
        // controller: textController,
        textInputAction: TextInputAction.done,
        cursorColor: primaryColor,
        decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIconColor: Colors.black,
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 18,
            ),
            hintText: "Search"),
      ),
    );
  }

  Widget getBannerSlider() {
    return BannerSlider(
      imgList: imgListBannerHome,
    );
  }

  Widget getTabBar(size) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.directions_car,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Bike',
                    ),
                  ),
                ),

                // second tab bar viiew widget
                Container(
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      'Car',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getUtilities(size) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Utilities",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GridView.count(
                      // shrinkWrap: true,
                      crossAxisCount: 2,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      children: List.generate(icons.length, (index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(icons[index]),
                                  fit: BoxFit.cover)),
                        );
                      })),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getItemsProduct(size) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productsList = snapshot.data!;

          // Hiển thị danh sách products ở đây
          return Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: TitleCategoryHomeWidget(title: 'Newest')),
              ListProductsWidget(displayProducts: getRandomList(productsList)),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Divider(),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: TitleCategoryHomeWidget(title: 'Most Popular')),
              ListProductsWidget(displayProducts: getRandomList(productsList)),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Divider(),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: TitleCategoryHomeWidget(title: 'Just For You')),
              ListProductsWidget(displayProducts: getRandomList(productsList)),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('Failed to fetch products');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  List<ProductModel> getRandomList(products) {
    List<ProductModel> mList = products;
    mList.shuffle();
    return mList.sublist(0, 6);
  }
}
