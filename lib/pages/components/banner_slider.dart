import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerSlider extends StatefulWidget {
  late List imgList;

  BannerSlider({Key? key, required this.imgList}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState(imgList);
}

class _BannerSliderState extends State<BannerSlider> {
  late List imgList;

  _BannerSliderState(this.imgList);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = imgList[index];

          return buildImage(imgUrl, index, size);
        },
        options: CarouselOptions(
          height: 150,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          // autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget buildImage(String imgUrl, int index, size) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // color: primaryColor.withOpacity(0.1),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Image.asset(
            imgUrl,
            fit: BoxFit.fill,
            width: size.width,
          ),
        ),
      );
}
