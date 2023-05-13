import 'package:app_shoes__shop/pages/see_more_page.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:flutter/material.dart';

class TitleCategoryHomeWidget extends StatelessWidget {
  final String title;

  const TitleCategoryHomeWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: const TextStyle(
                color: ColorUtils.primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SeeMorePage(category: title)));
            },
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all()
              // ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                "See more",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
