import 'package:app_shoes__shop/pages/cart_page.dart';
import 'package:app_shoes__shop/pages/categories_page.dart';
import 'package:app_shoes__shop/pages/home_page.dart';
import 'package:app_shoes__shop/pages/profile_page.dart';
import 'package:app_shoes__shop/pages/search_page.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int indexPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody(), bottomNavigationBar: getConvexAppBar());
  }

  Widget getBody() {
    return IndexedStack(
      index: indexPage,
      children: [
        const CategoriesPage(),
        SearchPage(isNavigatorCall: true),
        const HomePage(),
        const CartPage(),
        const ProfilePage()
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      indexPage = index;
    });
  }

  Widget getConvexAppBar() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: ColorUtils.primaryColor,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
          ]),
      child: ConvexAppBar(
        height: 50,
        top: -20,
        backgroundColor: Colors.white,
        activeColor: ColorUtils.primaryColor,
        color: const Color.fromARGB(255, 146, 165, 154),
        items: const [
          TabItem(icon: FlutterIcons.compass),
          TabItem(icon: Icons.search_rounded),
          TabItem(
            icon: Icons.home,
          ),
          TabItem(icon: Icons.shopping_cart),
          TabItem(icon: FlutterIcons.personOutline),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: _onItemTapped,
      ),
    );
  }
}
