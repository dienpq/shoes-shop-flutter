import 'package:app_shoes__shop/ultilities/constants.dart';
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

  static List<ShoesModel> shoesList = [
    ShoesModel(
      id: 1,
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: blueColor,
      brand: "Nike",
      imgPath: "2.png",
    ),
    ShoesModel(
      id: 2,
      name: "Converse X OPI Chuck Taylor",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: yellowColor,
      brand: "Converse",
      imgPath: "1.png",
    ),
    ShoesModel(
      id: 3,
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      color: redColor,
      brand: "Nike",
      imgPath: "3.png",
    ),
  ];
}
