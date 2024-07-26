  import 'package:flutter/material.dart';
  import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

  class FavoritesProvider extends ChangeNotifier {
    List<ProductsModel> _favorites = [];

    List<ProductsModel> get favorites => _favorites;

    void addFavorite(ProductsModel product) {
      _favorites.add(product);
      notifyListeners();
    }

    void removeFavorite(ProductsModel product) {
      _favorites.remove(product);
      notifyListeners();
    }
  }
