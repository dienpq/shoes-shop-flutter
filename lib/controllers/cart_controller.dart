import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/cart_model.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartTest = CartModel(1, DateTime.now(), cartInstance.getCart).obs;
  // Rx<CartModel> cartTest = cartInstance.obs;

  RxList<CartItemModel> itemsCartTest = cartInstance.cart.obs;

  void updateItems() {
    cartTest.value = CartModel(1, DateTime.now(), itemsCartTest);
  }
}
