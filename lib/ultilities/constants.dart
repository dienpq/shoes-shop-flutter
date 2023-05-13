import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<String?> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}

String? getUserIdFromToken(String token) {
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  if (decodedToken.containsKey('id')) {
    return decodedToken['id'];
  }
  return null;
}

DateTime? getTokenExpiration(String token) {
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  if (decodedToken.containsKey('exp')) {
    int expirationUnixTimestamp = decodedToken['exp'];
    return DateTime.fromMillisecondsSinceEpoch(expirationUnixTimestamp * 1000);
  }
  return null;
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<bool> checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    DateTime? exp = getTokenExpiration(token);
    if (exp != null && exp.isAfter(DateTime.now())) {
      return true;
    }
  }

  return false;
}

// Hàm chuyển đổi chuỗi màu hex thành đối tượng Color
Color getColorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll("#", "");
  return Color(int.parse("FF$hexCode", radix: 16));
}

// Host
const String host = '192.168.16.102';
