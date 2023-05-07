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
final CategoryModel categoryNike =
    CategoryModel(id: 1, name: "Nike", imgUrl: 'assets/logos/logo_nike.png');
final CategoryModel categoryAdidas = CategoryModel(
    id: 2, name: "Adidas", imgUrl: 'assets/logos/logo_adidas.png');
final CategoryModel categoryPuma =
    CategoryModel(id: 3, name: "Puma", imgUrl: 'assets/logos/logo_puma.png');
final CategoryModel categoryVans =
    CategoryModel(id: 4, name: "Vans", imgUrl: 'assets/logos/logo_vans.png');
final CategoryModel categoryNB = CategoryModel(
    id: 5, name: "New Balance", imgUrl: 'assets/logos/logo_new_balance.png');
final CategoryModel categoryConverse = CategoryModel(
    id: 6, name: "Converse", imgUrl: 'assets/logos/logo_converse.png');
final CategoryModel categorySupreme = CategoryModel(
    id: 7, name: "Supreme", imgUrl: 'assets/logos/logo_supreme.png');
final CategoryModel categoryReebook = CategoryModel(
    id: 8, name: "Reebook", imgUrl: 'assets/logos/logo_reebook.png');
final CategoryModel categoryBalenciaga = CategoryModel(
    id: 9, name: "Balenciaga", imgUrl: 'assets/logos/logo_balenciaga.png');

final List categoryList = [
  categoryNike,
  categoryAdidas,
  categoryPuma,
  categoryVans,
  categoryNB,
  categoryConverse,
  categorySupreme,
  categoryReebook,
  categoryBalenciaga
];

//---------------------- CUSTOMER MODEL -------------------------------

final CustomerModel customerInstance = CustomerModel(
    id: 1,
    name: "Phan Quang Điện",
    email: "dienpq1604@gmail.com",
    phoneNum: "0963865764",
    address: "So 26/116 - Miếu Đầm - Mễ Trì - Ha Noi");

//---------------------- ITEM CART MODEL -------------------------------

final ProductModel product1 = ProductModel(
    id: 1,
    name: 'Nike Air Jordan 1 Retro High',
    imagePath: "assets/images/products/nike/nike_1.png",
    brand: 'nike',
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: redColor,
    soldNum: Random().nextInt(100),
    discount: 20,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product2 = ProductModel(
    id: 2,
    name: 'Nike Air Jordan 1 Low SE \'Nothing But Net\'',
    imagePath: "assets/images/products/nike/nike_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: blueColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 15,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product3 = ProductModel(
    id: 3,
    name: 'Nike Air Force 1 \'Triple Black/\'',
    imagePath: "assets/images/products/nike/nike_3.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product4 = ProductModel(
    id: 4,
    name: 'Nike Air Jordan 1 Low “Triple White”',
    imagePath: "assets/images/products/nike/nike_4.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product5 = ProductModel(
    id: 5,
    name: 'Nike Air Force 1 Low White Black',
    imagePath: "assets/images/products/nike/nike_5.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product6 = ProductModel(
    id: 6,
    name: 'Nike Air Max 97 \'White Violet\'',
    imagePath: "assets/images/products/nike/nike_6.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product7 = ProductModel(
    id: 7,
    name: 'Nike Wmns Air Jordan 1 Low \'White Wolf Grey\'',
    imagePath: "assets/images/products/nike/nike_7.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: orangeColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product8 = ProductModel(
    id: 8,
    name: 'Nike Air Jordan 1 Low Light Smoke Grey',
    imagePath: "assets/images/products/nike/nike_8.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: orangeColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product9 = ProductModel(
    id: 9,
    name: 'Nike Air Force 1 LE GS \'Triple White\'',
    imagePath: "assets/images/products/nike/nike_9.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: orangeColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product10 = ProductModel(
    id: 10,
    name: 'Nike Air Jordan 1 Mid Laser Blue',
    imagePath: "assets/images/products/nike/nike_10.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product11 = ProductModel(
    id: 11,
    name: 'Nike Blazer Mid \'77 Vintage White Black\'',
    imagePath: "assets/images/products/nike/nike_11.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'nike',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product12 = ProductModel(
    id: 12,
    name: 'Adidas Stan Smith',
    imagePath: "assets/images/products/adidas/adidas_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 20,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product13 = ProductModel(
    id: 13,
    name: 'Adidas SuperStar',
    imagePath: "assets/images/products/adidas/adidas_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: lightGreenColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product14 = ProductModel(
    id: 14,
    name: 'Adidas Ultraboost 22',
    imagePath: "assets/images/products/adidas/adidas_3.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product15 = ProductModel(
    id: 15,
    name: 'Adidas Forta Sport Running',
    imagePath: "assets/images/products/adidas/adidas_4.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: redColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 10,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product16 = ProductModel(
    id: 16,
    name: 'Adidas Lite Racer 3.0',
    imagePath: "assets/images/products/adidas/adidas_5.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product17 = ProductModel(
    id: 17,
    name: 'Adidas Continental 80',
    imagePath: "assets/images/products/adidas/adidas_6.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: vintageBlueColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product18 = ProductModel(
    id: 18,
    name: 'Adidas Duramo SL 2.0',
    imagePath: "assets/images/products/adidas/adidas_7.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product19 = ProductModel(
    id: 19,
    name: 'Adidas Harden Vol.6',
    imagePath: "assets/images/products/adidas/adidas_8.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product20 = ProductModel(
    id: 20,
    name: 'Adidas NMD_R1 PrimeBlue',
    imagePath: "assets/images/products/adidas/adidas_9.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: strongBlueColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product21 = ProductModel(
    id: 21,
    name: 'Adidas Ultraboost 1.0 DNA Running Sportwear LifeStyle',
    imagePath: "assets/images/products/adidas/adidas_10.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'adidas',
    soldNum: Random().nextInt(100),
    discount: 25,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product22 = ProductModel(
    id: 22,
    name: 'Balenciaga Triple S logo-embroidered',
    imagePath: "assets/images/products/balenciaga/balenciaga_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: blackColor,
    brand: 'balenciaga',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product23 = ProductModel(
    id: 23,
    name: 'Balenciaga Track logo-detailed mesh',
    imagePath: "assets/images/products/balenciaga/balenciaga_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'balenciaga',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product24 = ProductModel(
    id: 24,
    name: 'Converse Outlet Rubber low',
    imagePath: "assets/images/products/converse/converse_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: yellowColor,
    brand: 'converse',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product25 = ProductModel(
    id: 25,
    name: 'Converse AllStar CX high',
    imagePath: "assets/images/products/converse/converse_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'converse',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product26 = ProductModel(
    id: 26,
    name: 'Converse Colorblock 1970s high',
    imagePath: "assets/images/products/converse/converse_3.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'converse',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product27 = ProductModel(
    id: 27,
    name: 'Converse 1970s Heart of the City high',
    imagePath: "assets/images/products/converse/converse_4.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'converse',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product28 = ProductModel(
    id: 28,
    name: 'Converse Chuck Lugged 2.0 high',
    imagePath: "assets/images/products/converse/converse_5.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: brownColor,
    brand: 'converse',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product29 = ProductModel(
    id: 29,
    name: 'New Balance 574 Classic Lifestyle',
    imagePath: "assets/images/products/new_balance/new_balance_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product30 = ProductModel(
    id: 30,
    name: 'New Balance Fresh Foam X Vongo V5',
    imagePath: "assets/images/products/new_balance/new_balance_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: vintageBlueColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product31 = ProductModel(
    id: 31,
    name: 'New Balance Fresh Foam 1080v11',
    imagePath: "assets/images/products/new_balance/new_balance_3.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: orangeColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product32 = ProductModel(
    id: 32,
    name: 'New Balance Cushioning ',
    imagePath: "assets/images/products/new_balance/new_balance_4.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product33 = ProductModel(
    id: 33,
    name: 'New Balance Fresh Foam V2',
    imagePath: "assets/images/products/new_balance/new_balance_5.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product34 = ProductModel(
    id: 34,
    name: 'New Balance Fresh Foam EVOZ',
    imagePath: "assets/images/products/new_balance/new_balance_6.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product35 = ProductModel(
    id: 35,
    name: 'New Balance Fuel REBEL V2',
    imagePath: "assets/images/products/new_balance/new_balance_7.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: vintageBlueColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product36 = ProductModel(
    id: 36,
    name: 'New Balance WRAP & RUN',
    imagePath: "assets/images/products/new_balance/new_balance_8.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: primaryColor,
    brand: 'new balance',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product37 = ProductModel(
    id: 37,
    name: 'Supremen More Uptemo',
    imagePath: "assets/images/products/supreme/supreme_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: redColor,
    brand: 'supreme',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product38 = ProductModel(
    id: 38,
    name: 'Supremen Lace Road',
    imagePath: "assets/images/products/supreme/supreme_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: redColor,
    brand: 'supreme',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product39 = ProductModel(
    id: 39,
    name: 'Vans Old Skool Checkboard Black/White',
    imagePath: "assets/images/products/vans/vans_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: blackColor,
    brand: 'vans',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product40 = ProductModel(
    id: 40,
    name: 'Vans Old Skool Classic Black/White',
    imagePath: "assets/images/products/vans/vans_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: greyColor,
    brand: 'vans',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product41 = ProductModel(
    id: 41,
    name: 'Vans Vault OG Classic Slip On',
    imagePath: "assets/images/products/vans/vans_3.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: blackColor,
    brand: 'vans',
    soldNum: Random().nextInt(100),
    discount: 12,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product42 = ProductModel(
    id: 42,
    name: 'Puma Supertec Men Shoes',
    imagePath: "assets/images/products/puma/puma_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: vintageBlueColor,
    brand: 'puma',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product43 = ProductModel(
    id: 43,
    name: 'Puma Seawalk Men Running Shoes',
    imagePath: "assets/images/products/puma/puma_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: orangeColor,
    brand: 'puma',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product44 = ProductModel(
    id: 44,
    name: 'Reebook Legacy AZ',
    imagePath: "assets/images/products/reebook/reebook_1.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: blueColor,
    brand: 'reebook',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final ProductModel product45 = ProductModel(
    id: 45,
    name: 'Reebook Question Mid White Red',
    imagePath: "assets/images/products/reebook/reebook_2.png",
    desc:
        "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
    color: milkColor,
    brand: 'reebook',
    soldNum: Random().nextInt(100),
    discount: 0,
    price: (Random().nextInt(2000) + 500).toDouble());

final List<ProductModel> products = [
  product1,
  product2,
  product3,
  product4,
  product5,
  product6,
  product7,
  product8,
  product9,
  product10,
  product11,
  product12,
  product13,
  product14,
  product15,
  product16,
  product17,
  product18,
  product19,
  product20,
  product21,
  product22,
  product23,
  product24,
  product25,
  product26,
  product27,
  product28,
  product29,
  product30,
  product31,
  product32,
  product33,
  product34,
  product35,
  product36,
  product37,
  product38,
  product39,
  product40,
  product41,
  product42,
  product43,
  product44,
  product45,
];

//---------------------- CART MODEL -------------------------------

final CartItemModel cartItem1 = CartItemModel(product1, 2);
final CartItemModel cartItem2 = CartItemModel(product2, 2);
final CartItemModel cartItem3 = CartItemModel(product3, 5);
final CartItemModel cartItem4 = CartItemModel(product4, 4);
final CartItemModel cartItem5 = CartItemModel(product5, 1);

final List<CartItemModel> itemsInCart = [
  cartItem1,
  cartItem2,
  cartItem3,
];

final CartModel cartInstance = CartModel(1, DateTime.now(), itemsInCart);

//---------------------- CART MODEL -------------------------------

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

final UserModel user = UserModel(
  'Phan Dien',
  'assets/images/default_avatar.webp',
  '16/04/2001',
  'neakershop@gmail.com',
  '0123456789',
  'Mo Lao, Ha Dong, Hanoi',
);
