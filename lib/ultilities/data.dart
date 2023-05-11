//---------------------- ICONS -------------------------------
import 'dart:math';

import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/cart_model.dart';
import 'package:app_shoes__shop/models/category_model.dart';
import 'package:app_shoes__shop/models/customer_model.dart';
import 'package:app_shoes__shop/models/notification_model.dart';
import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/models/user_model.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final List icons = [
  'https://cdn-icons-png.flaticon.com/128/7483/7483830.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483693.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483685.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483708.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483691.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483679.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483742.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483681.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483806.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483739.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483803.png',
  'https://cdn-icons-png.flaticon.com/128/7483/7483754.png',
];

//---------------------- IMAGES BANNER -------------------------------

final List<String> imgListBannerHome = [
  'assets/home_banners/home_banner_1.jpg',
  'assets/home_banners/home_banner_2.webp',
  'assets/home_banners/home_banner_3.webp',
  'assets/home_banners/home_banner_4.webp',
  'assets/home_banners/home_banner_5.jpg',
];

final List<String> imgListBannerSeeMore = [
  'assets/seemore_banners/seemore_banner_1.webp',
  'assets/seemore_banners/seemore_banner_2.webp',
  'assets/seemore_banners/seemore_banner_3.webp',
  'assets/seemore_banners/seemore_banner_4.webp',
  'assets/seemore_banners/seemore_banner_5.webp'
];

final List<String> imgListBannerCategory = [
  'assets/category_banners/category_banner_1.webp',
  'assets/category_banners/category_banner_2.jpg',
  'assets/category_banners/category_banner_3.jpeg',
  'assets/category_banners/category_banner_4.jpg',
  'assets/category_banners/category_banner_5.png',
  'assets/category_banners/category_banner_6.jpg',
];

//---------------------- CATEGORY INSTANCE -------------------------------
Future<List<CategoryModel>> fetchCategories() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/api/categories'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final categories = jsonData['categories'] as List<dynamic>;

    return categories.map((category) {
      return CategoryModel(
        id: category['_id'],
        name: category['name'],
        imgUrl: category['imgUrl'],
      );
    }).toList();
  } else {
    throw Exception('Failed to fetch categories');
  }
}

//---------------------- CUSTOMER MODEL -------------------------------

final CustomerModel customerInstance = CustomerModel(
    id: 1,
    name: "Phan Quang Điện",
    email: "dienpq1604@gmail.com",
    phoneNum: "0963865764",
    address: "So 26/116 - Miếu Đầm - Mễ Trì - Ha Noi");

//---------------------- ITEM CART MODEL -------------------------------

Future<List<ProductModel>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/api/products'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final products = jsonData['products'] as List<dynamic>;

    return products.map((product) {
      return ProductModel(
        id: product['_id'],
        name: product['name'],
        imagePath: product['imagePath'],
        brand: product['brand'],
        desc: product['desc'],
        color: product['color'],
        soldNum: product['soldNum'],
        discount: product['discount'],
        price: product['price'],
      );
    }).toList();
  } else {
    throw Exception('Failed to fetch products');
  }
}

//---------------------- CART MODEL -------------------------------

Future<CartModel> fetchCart(String userId) async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/api/users/$userId/cart'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    final products = jsonData['products'] as List<dynamic>;

    final List<CartItemModel> cartItems = products.map((jsonItem) {
      final product = ProductModel(
        id: jsonItem['product']['_id'],
        name: jsonItem['product']['name'],
        imagePath: jsonItem['product']['imagePath'],
        brand: jsonItem['product']['brand'],
        desc: jsonItem['product']['desc'],
        color: jsonItem['product']['color'],
        soldNum: jsonItem['product']['soldNum'],
        discount: jsonItem['product']['discount'],
        price: jsonItem['product']['price'],
      );

      final amount = jsonItem['amount'];

      return CartItemModel(product, amount);
    }).toList();

    final cartId = jsonData['_id'];
    final cartDate = DateTime.now();

    return CartModel(cartId, cartDate, cartItems);
  } else {
    throw Exception('Failed to fetch cart');
  }
}

Future<void> deleteCart(String cartId) async {
  final url = Uri.parse('http://localhost:3000/api/carts/$cartId');

  try {
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to delete products from cart. Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to fetch delete cart $error');
  }
}

Future<void> addToCart(String userId, String productId, int amount) async {
  final url = Uri.parse('http://localhost:3000/api/carts');

  final data = {
    'userId': userId,
    'product': productId,
    'amount': amount,
  };

  try {
    await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  } catch (error) {
    throw Exception('Error: $error');
  }
}

Future<void> deleteProductFromCart(String cartId, String productId) async {
  final url = Uri.parse('http://localhost:3000/api/carts/$cartId/products/$productId');

  try {
    await http.delete(url);
  } catch (error) {
    throw Exception('Error: $error');
  }
}

Future<void> decreaseProductAmountInCart(String cartId, String productId) async {
  final url = Uri.parse('http://localhost:3000/api/carts/$cartId/products/$productId/decrease');

  try {
    await http.put(url);
  } catch (error) {
    throw Exception('Error: $error');
  }
}

//---------------------- NOTIFYCATION MODEL -------------------------------

final NotificationModel notification1 = NotificationModel(
    id: 1,
    title: '30% Special Discount',
    content: 'Special promotion only valid today',
    type: 'discount',
    time: 'Today');

final NotificationModel notification2 = NotificationModel(
    id: 2,
    title: 'Order Successfully',
    content:
        'Thank you for support us. Your order will be deliveried within few days.',
    type: 'order',
    time: 'Yesterday');

final NotificationModel notification3 = NotificationModel(
    id: 3,
    title: '50% Special Discount',
    content: 'Special promotion only valid today',
    type: 'discount',
    time: 'Last Month');

final NotificationModel notification4 = NotificationModel(
    id: 4,
    title: 'Credit Card Connected',
    content: 'Credit Card has been linked',
    type: 'connect',
    time: 'Today');

final NotificationModel notification5 = NotificationModel(
    id: 5,
    title: '30% Special Discount',
    content: 'Special promotion only valid today',
    type: 'discount',
    time: 'Last Month');
final NotificationModel notification6 = NotificationModel(
    id: 6,
    title: 'Order Successfully',
    content:
        'Thank you for support us. Your order will be deliveried within few days.',
    type: 'order',
    time: 'Last Month');
final NotificationModel notification7 = NotificationModel(
    id: 7,
    title: 'Order Successfully',
    content:
        'Thank you for support us. Your order will be deliveried within few days.',
    type: 'order',
    time: 'Last Month');

final List<NotificationModel> notifications = [
  notification1,
  notification2,
  notification3,
  notification4,
  notification5,
  notification6,
  notification7,
];

Future<UserModel> fetchUser() async {
  final response = await http.get(
      Uri.parse('http://localhost:3000/api/users/6459b5d52d02778a9dce7c29'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return UserModel(
      jsonData['_id'],
      jsonData['fullname'],
      jsonData['avatar'],
      jsonData['birthday'],
      jsonData['email'],
      jsonData['phoneNum'],
      jsonData['address'],
    );
  } else {
    throw Exception('Failed to fetch user');
  }
}
