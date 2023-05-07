import 'package:app_shoes__shop/controllers/cart_controller.dart';
import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool isChecked = false;
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Check out'),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: getBodyHome(),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

  Widget getBodyHome() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              getIntro(),
              getInfoCustomer(),
              Divider(
                color: primaryColor.withOpacity(0.2),
                thickness: 7,
              ),
              getChooseAll(isChecked),
              Divider(
                color: primaryColor.withOpacity(0.2),
                thickness: 2,
              ),
              getItems(),
              Divider(
                color: primaryColor.withOpacity(0.2),
                thickness: 7,
              ),
              getAdditionalFee(),
            ],
          ),
        ),
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

  Widget getAdditionalFee() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        "Subtotal",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Obx(() => Text(
                        '\$${getTotalPay(cartController.itemsCartTest)}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delivery_dining_rounded,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        "Delivery Fee",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Text(
                    "\$8.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.trending_up_rounded,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        "VAT",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Text(
                    "\$2.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.receipt_rounded,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        "Discount",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    "-0% (\$0.00)",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: primaryLightColor.withOpacity(0.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.paid_rounded,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Obx(() => Text(
                        '\$${getTotalPay(cartController.itemsCartTest) + 10}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
          ],
        ));
  }

  Widget getIntro() {
    return Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            border: Border(
              bottom:
                  BorderSide(width: 0.5, color: primaryColor.withOpacity(0.2)),
            )),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: RichText(
                      text: const TextSpan(children: [
                TextSpan(
                    text:
                        "Free shipping for orders from 149k of each seller with logo",
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " FREESHIP+",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16)),
              ]))),
              Icon(Icons.info_outline,
                  color: Colors.black.withOpacity(0.5), size: 22)
            ],
          ),
        ));
  }

  Widget getInfoCustomer() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: primaryColor,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "${customerInstance.getName}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              customerInstance.phoneNum,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${customerInstance.getAddress}",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        )
                      ],
                    ))),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16)
          ],
        ));
  }

  Widget getChooseAll(bool checkBox) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Obx(() => Text(
                      "Total (${cartController.itemsCartTest.length} products)",
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: primaryColor,
                  size: 27,
                ))
          ],
        ));
  }

  Widget getItems() {
    var size = MediaQuery.of(context).size;
    return Obx(() => Column(
            children:
                List.generate(cartController.itemsCartTest.length, (index) {
          var item = cartController.itemsCartTest[index];

          return Container(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: 1.0,
                  color: (index == cartInstance.getCart.length - 1)
                      ? Colors.white
                      : primaryColor.withOpacity(0.2)),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    )),
                Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: size.width / 3,
                      height: size.width / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  item.getProduct.getImageUrl.toString()))),
                    )),
                getInfoItem(item),
              ],
            ),
          );
        })));
  }

  Widget getTotalPrice() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: GestureDetector(
        onTap: () {
          showDialogSubmit();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 1)
              ]),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  'ORDER',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialogSubmit() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 10),
            Text(
              'Success!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 7),
            Text('Order Successfully')
          ],
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }

  Widget getInfoItem(item) {
    return Flexible(
        flex: 3,
        child: Stack(
          children: [
            Flexible(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.getProduct.getName}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RichText(
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
                Row(
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
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: primaryColor,
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
                        },
                        child:
                            Icon(Icons.add_circle_outline, color: primaryColor))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.trending_down_outlined,
                      size: 15,
                      color: yellowColor,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      "Decreasing Price",
                      style: TextStyle(color: yellowColor, fontSize: 12),
                    )
                  ],
                )
              ],
            )),
            Positioned(
                bottom: 0,
                right: 5,
                child: TextButton(
                    onPressed: () {
                      cartController.itemsCartTest.remove(item);
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ));
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
      child: Row(),
    );
  }
}
