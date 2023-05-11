import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/cart_model.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  dynamic cartTest;

  RxList<CartItemModel> itemsCartTest = RxList<CartItemModel>();

  void clearItems() {
    try {
      deleteCart('645cb2094df08de8a1767469');
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch delete cart: $error');
    }
  }

  void addItem(userId, productId, amount) {
    try {
      addToCart(userId, productId, amount);
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch add item cart: $error');
    }
  }

  void deleteItem(cardId, productId) {
    try {
      deleteProductFromCart(cardId, productId);
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch delete item cart: $error');
    }
  }

  void desAmountItem(cardId, productId) {
    try {
      decreaseProductAmountInCart(cardId, productId);
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
      CartModel cartInstance = await fetchCart('6459b5d52d02778a9dce7c29');
      cartTest = cartInstance.obs;
      itemsCartTest.value = cartInstance.cart;
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch products: $error');
    }
  }
}
