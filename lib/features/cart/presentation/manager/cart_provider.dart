import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/data/models/cart_item_model.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/variant.dart';

class CartProvider extends ChangeNotifier {
  final List<Variant> _items = [];
  List<Variant> get items => _items;
  void addItem(Variant item) {
    print("added items is : $item");
    final existingItemIndex =
        _items.indexWhere((element) => element.name == item.name);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].count += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(Variant item) {
    final existingItemIndex =
        items.indexWhere((element) => element.name == item.name);
    if (existingItemIndex >= 0) {
      items[existingItemIndex].count -= 1;
      if (items[existingItemIndex].count == 0) {
        items.removeAt(existingItemIndex);
      }
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in items) {
      int price = item.price as int;
      total += price * item.count;
    }
    return total;
  }
}
