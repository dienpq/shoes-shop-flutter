import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/cart_model.dart';
import 'package:app_shoes__shop/ultilities/action.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  dynamic cartTest;

  RxList<CartItemModel> itemsCartTest = RxList<CartItemModel>();

  void clearItems() {
    try {
      deleteCart();
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch delete cart: $error');
    }
  }

  void addItem(productId, amount) {
    try {
      addToCart(productId, amount);
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch add item cart: $error');
    }
  }

  void deleteItem(productId) {
    try {
      deleteProductFromCart(productId);
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch delete item cart: $error');
    }
  }

  void desAmountItem(productId) {
    try {
      decreaseProductAmountInCart(productId);
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch delete item cart: $error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCartFromApi();
  }

  void fetchCartFromApi() async {
    try {
      CartModel cartInstance = await fetchCart();
      cartTest = cartInstance.obs;
      itemsCartTest.value = cartInstance.cart;
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch products: $error');
    }
  }
}
