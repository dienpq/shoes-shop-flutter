import 'package:app_shoes__shop/models/cart_item_model.dart';
class CartModel {
  String id;
  DateTime time;
  List<CartItemModel> cart;

  CartModel(this.id, this.time, this.cart);

  get getId => id;

  set setId(id) => this.id = id;

  get getTime => time;

  set setTime(time) => this.time = time;

  get getCart => cart;

  set setCart(cart) => this.cart = cart;
}
