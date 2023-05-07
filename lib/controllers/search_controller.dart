import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxString keywordSearch = ''.obs;
  RxList<ProductModel> foundProducts = products.obs;

  void getTextInput(textInput) {
    keywordSearch = textInput;
  }
}
