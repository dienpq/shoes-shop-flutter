import 'package:app_shoes__shop/models/category_model.dart';
import 'package:app_shoes__shop/pages/category_items_page.dart';
import 'package:app_shoes__shop/pages/components/banner_slider.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: getBodyHome(size),
    );
  }

  Widget getBodyHome(size) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black),
              ),
              Container(
                width: size.width / 5,
                padding: EdgeInsets.only(left: size.width / 5 * 0.1),
                color: ColorUtils.primaryColor,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.list_alt_rounded,
                        size: 32, color: ColorUtils.primaryBgColor)),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        BannerSlider(imgList: imgListBannerCategory),
        const SizedBox(height: 35),
        FutureBuilder<List<CategoryModel>>(
          future: fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categoryList = snapshot.data!;

              // Hiển thị danh sách categoryList ở đây
              return getCategoryListVertical(size, categoryList);
            } else if (snapshot.hasError) {
              return const Text('Failed to fetch categories');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Widget getCategoryListVertical(size, List<CategoryModel> categoryList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
            direction: Axis.horizontal,
            spacing: 5,
            runSpacing: 5,
            children: List.generate(categoryList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CategoryItemsPage(
                          brand: categoryList[index].getName)));
                },
                child: Container(
                  height: (size.width) / 3,
                  width: (size.width) / 4 + 10,
                  padding: const EdgeInsets.all(10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        height: 55,
                        width: 55,
                        // padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image:
                                    AssetImage(categoryList[index].getImgUrl),
                                fit: BoxFit.fitWidth)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${categoryList[index].getName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ],
    );
  }
}
