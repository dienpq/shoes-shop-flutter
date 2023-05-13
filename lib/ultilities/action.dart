import 'package:app_shoes__shop/models/cart_item_model.dart';
import 'package:app_shoes__shop/models/cart_model.dart';
import 'package:app_shoes__shop/models/category_model.dart';
import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/models/user_model.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<CategoryModel>> fetchCategories() async {
  final response =
      await http.get(Uri.parse('http://$host:3000/api/categories'));

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

Future<List<ProductModel>> fetchProducts() async {
  final response = await http.get(Uri.parse('http://$host:3000/api/products'));

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

Future<CartModel> fetchCart() async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final response =
      await http.get(Uri.parse('http://$host:3000/api/users/$userId/cart'));

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

Future<void> deleteCart() async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final url = Uri.parse('http://$host:3000/api/carts/$userId');

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

Future<void> addToCart(String productId, int amount) async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final url = Uri.parse('http://$host:3000/api/carts');

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

Future<void> deleteProductFromCart(String productId) async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final url =
      Uri.parse('http://$host:3000/api/carts/$userId/products/$productId');

  try {
    await http.delete(url);
  } catch (error) {
    throw Exception('Error: $error');
  }
}

Future<void> decreaseProductAmountInCart(String productId) async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final url = Uri.parse(
      'http://$host:3000/api/carts/$userId/products/$productId/decrease');

  try {
    await http.put(url);
  } catch (error) {
    throw Exception('Error: $error');
  }
}



Future<UserModel> fetchUser() async {
  String? token = await getToken();
  String? userId = getUserIdFromToken(token!);
  final response =
      await http.get(Uri.parse('http://$host:3000/api/users/$userId'));

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

Future<bool> checkLogin(String username, String password) async {
  final url = Uri.parse(
      'http://$host:3000/login'); // Thay thế bằng URL API login của bạn

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    String token = jsonResponse['token'];

    if (token.isNotEmpty) {
      await saveToken(token);

      return true;
    }
  }
  return false;
}
