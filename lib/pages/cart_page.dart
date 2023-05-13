import 'package:app_shoes__shop/controllers/cart_controller.dart';
import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/pages/check_out_page.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  var cartController = Get.put(CartController());

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  "Your Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
              Container(
                width: size.width / 5,
                padding: EdgeInsets.only(left: size.width / 5 * 0.1),
                color: ColorUtils.primaryColor,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined,
                        size: 32, color: ColorUtils.primaryBgColor)),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: Obx(() => Text(
                      'Total: ${cartController.itemsCartTest.length} products',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ))),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  cartController.clearItems();
                  cartController.itemsCartTest.clear();
                },
                child: Text(
                  'Clear all',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(
            color: ColorUtils.primaryColor,
            thickness: 2,
          ),
        ),
        getItems(),
        getTotalPrice()
      ],
    );
  }

  double getTotalPay(List<CartItemModel> cartItemsList) {
    double total = 0;
    for (var item in cartItemsList) {
      total += item.getProduct.getPrice * item.getQuantity;
    }
    return total;
  }

  Widget getTotalPrice() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 27, top: 12, left: 25, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total price',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45)),
                const SizedBox(height: 3),
                Obx(() => Text('\$${getTotalPay(cartController.itemsCartTest)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24))),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (cartController.itemsCartTest.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CheckOutPage()),
                  );
                } else {
                  // Show snack bar
                  const snackBar = SnackBar(
                    content: Text('You don\'t have any products.'),
                    duration: Duration(seconds: 1),
                    backgroundColor: Color.fromARGB(221, 0, 114, 82),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: ColorUtils.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getItems() {
    var size = MediaQuery.of(context).size;
    return Obx(() => (cartController.itemsCartTest.isNotEmpty)
        ? Expanded(
            child: SizedBox(
              height: 200,
              child: Obx(
                () => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartController.itemsCartTest.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = cartController.itemsCartTest[index];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 12, left: 10),
                            width: size.width / 3.5,
                            height: size.width / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                  item.getProduct.getImageUrl.toString(),
                                ),
                              ),
                            ),
                          ),
                          getInfoItem(item),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        : Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height / 7),
                width: size.width / 2.5,
                height: size.height / 5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    // fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/img_buy_more_2.png'),
                  ),
                ),
              ),
              const Text('Continue Shopping!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: size.width / 1.5,
                child: const Text('You dont have any products in your cart.',
                    textAlign: TextAlign.center),
              )
            ],
          )));
  }

  Widget getInfoItem(item) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${item.getProduct.getName}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    cartController.deleteItem(item.getProduct.getId);
                    cartController.itemsCartTest.remove(item);
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          Text(
            'Size 42 | Multi color',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7)),
          ),
          const SizedBox(height: 7),
          const Row(
            children: [
              Icon(
                Icons.trending_down_outlined,
                size: 15,
                color: ColorUtils.yellowColor,
              ),
              SizedBox(
                width: 1,
              ),
              Text(
                "Decreasing Price",
                style: TextStyle(color: ColorUtils.yellowColor, fontSize: 12),
              )
            ],
          ),
          // SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "\$${item.getProduct.getPrice}  ",
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\$${item.getProduct.getPrice}",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough),
                  )
                ])),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorUtils.primaryBgColor),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        CartItemModel temporaryCartItem = item;
                        int id = cartController.itemsCartTest.indexOf(item);
                        if (temporaryCartItem.quantity <= 1) {
                          // temporaryCartItem.quantity = 0;
                          cartController.itemsCartTest
                              .remove(temporaryCartItem);
                        } else {
                          temporaryCartItem.quantity -= 1;
                          cartController.itemsCartTest[id] = temporaryCartItem;
                        }

                        cartController.desAmountItem(item.getProduct.getId);
                      },
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: ColorUtils.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.getQuantity.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                        onTap: () {
                          CartItemModel temporaryCartItem = item;
                          temporaryCartItem.quantity += 1;
                          int id = cartController.itemsCartTest.indexOf(item);
                          cartController.itemsCartTest[id] = temporaryCartItem;

                          cartController.addItem(item.getProduct.getId, 1);
                        },
                        child:
                            const Icon(Icons.add_circle_outline, color: ColorUtils.primaryColor))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getCheckOut() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
      child: const Row(),
    );
  }
}
