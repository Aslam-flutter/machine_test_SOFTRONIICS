import 'dart:convert';
import 'dart:developer';

import 'package:mechine_test/model/products_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ProductsModel>> getProducts() async {
    final url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> body = await jsonDecode(response.body);

        return body.map((e) => ProductsModel.fromJson(e)).toList();
      }
    } catch (e) {
      log((e.toString()));
    }
    return [];
  }

  Future<List<ProductsModel>> getProductDetails(String id) async {
    final url = 'https://fakestoreapi.com/products/$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> body = await jsonDecode(response.body);

        return body.map((e) => ProductsModel.fromJson(e)).toList();
      }
    } catch (e) {
      log((e.toString()));
    }
    return [];
  }
}
