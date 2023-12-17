import 'package:hello_world_app/products/model/product_model.dart';
import 'package:hello_world_app/products/repo/product_repository.dart';

class ProductController {
  final repo = ProductRepo();

  Future getProduct() async {
    var responseData = repo.getProduct();
    if (responseData != null) {
      return responseData;
    }
    return [];
  }
}
