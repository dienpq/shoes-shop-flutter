import 'package:app_shoes__shop/models/notification_model.dart';


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


