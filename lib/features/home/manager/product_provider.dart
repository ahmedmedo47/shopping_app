import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductsModel> _favoriteProducts = [];

  List<ProductsModel> get favoriteProducts => _favoriteProducts;

  void addFavorite(ProductsModel product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(ProductsModel product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
      notifyListeners();
    }
  }
}
