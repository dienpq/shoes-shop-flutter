import 'package:app_shoes__shop/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  final ProductModel product;
  const DetailOrderPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Detail Order Page',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(product.name)
      ],
    );
  }
}
