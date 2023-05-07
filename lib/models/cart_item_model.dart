import 'package:app_shoes__shop/models/product_model.dart';

class CartItemModel {
  ProductModel product;
  int quantity;

  CartItemModel(this.product, this.quantity);

  get getProduct => product;

  set setProduct(product) => this.product = product;

  get getQuantity => quantity;

  set setQuantity(quantity) => this.quantity = quantity;
}
