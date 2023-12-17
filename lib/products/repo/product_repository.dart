import 'dart:developer';

import 'package:hello_world_app/products/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future getProduct() async {
    try {
      String url = 'https://fakestoreapi.com/products';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body.toString());
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
  }
}
