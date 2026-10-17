import 'package:flutter/material.dart';
import 'package:mechine_test/model/products_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductsModel> _cartItems = [];

  List<ProductsModel> get cartItems => _cartItems;

  void addToCart(ProductsModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductsModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, product) => total + (product.price ?? 0));
  }
}
