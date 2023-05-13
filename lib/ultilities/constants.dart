import 'package:flutter/material.dart';

// Hàm chuyển đổi chuỗi màu hex thành đối tượng Color
Color getColorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll("#", "");
  return Color(int.parse("FF$hexCode", radix: 16));
}

// Host
const String host = '192.168.16.102';
