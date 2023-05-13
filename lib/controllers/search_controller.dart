import 'package:app_shoes__shop/models/product_model.dart';
import 'package:app_shoes__shop/ultilities/action.dart';
import 'package:get/get.dart';

class SearchProductController extends GetxController {
  RxString keywordSearch = ''.obs;
  RxList<ProductModel> foundProducts = RxList<ProductModel>();

  @override
  void onInit() {
    super.onInit();
    fetchProductsFromApi();
  }

  void fetchProductsFromApi() async {
    try {
      List<ProductModel> products = await fetchProducts();
      foundProducts.value = products;
    } catch (error) {
      // ignore: avoid_print
      print('Failed to fetch products: $error');
    }
  }

  void getTextInput(textInput) {
    keywordSearch = textInput;
  }
}
