import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/pages/components/order_card_widget.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: ColorUtils.primaryColor,
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
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "My Orders",
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
                      icon: const Icon(Icons.tune, color: ColorUtils.primaryBgColor)),
                )
              ],
            ),
          ),
          Expanded(child: getTabBar(size))
        ]),
      ),
    );
  }

  Widget getTabBar(size) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: const TabBar(
                indicatorColor: ColorUtils.primaryColor,
                indicatorWeight: 3,
                labelColor: ColorUtils.primaryColor,
                unselectedLabelColor: ColorUtils.primaryLightColor,
                physics: ScrollPhysics(),
                tabs: [
                  Tab(
                    child: Text(
                      'Active',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ProductModel>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final products = snapshot.data!;

                  return TabBarView(
                    children: [
                      // first tab bar view widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(2, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: OrderCardWidget(
                                    product: products[index], isActive: true),
                              );
                            })),
                      ),

                      // second tab bar view widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(3, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: OrderCardWidget(
                                  product: products[index],
                                  isActive: false,
                                ),
                              );
                            })),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text('Failed to fetch products');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
