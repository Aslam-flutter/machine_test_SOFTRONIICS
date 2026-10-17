import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mechine_test/core/api_services.dart';
import 'package:mechine_test/model/products_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    getProducts();
    getProductDetails('');
  }
  List<ProductsModel> products = [];
  List<ProductsModel> productDetails = [];

  bool isLoading = false;

  Future<void> getProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await ApiServices().getProducts();

      _products = products;
      _filteredProducts = products;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getProductDetails(String id) async {
    try {
      isLoading = true;
      notifyListeners();
      productDetails = await ApiServices().getProductDetails(id);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  List<ProductsModel> _products = [];
  List<ProductsModel> _filteredProducts = [];

  List<ProductsModel> get filteredProducts => _filteredProducts;

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where(
            (product) => (product.title ?? '').toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    }

    notifyListeners();
  }
}
