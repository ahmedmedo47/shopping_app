import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/variant.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Variant> _favorites = [];
  List<Variant> get favorites => _favorites;

  void addFavorite(Variant product) {
    _favorites.add(product);
    log("added product is : $product");
    notifyListeners();
  }

  void removeFavorite(Variant product) {
    _favorites.remove(product);
    log("removed product is : $product");
    notifyListeners();
  }
}
