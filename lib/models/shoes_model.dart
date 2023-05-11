import 'package:flutter/material.dart';

class ShoesModel {
  final int id;
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoesModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.desc,
      required this.color,
      required this.brand,
      required this.imgPath});
}
