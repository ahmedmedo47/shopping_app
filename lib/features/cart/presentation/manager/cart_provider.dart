import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/data/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;
  final List<CartItemModel> products = [
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 1.0,
      title: 'Product 1',
      size: 'XL',
    ),
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 1.0,
      title: 'Product 1',
      size: 'XL',
    ),
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 50.0,
      title: 'Product 2',
      size: 'XL',
    ),
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 1.0,
      title: 'Product 3',
      size: 'XL',
    ),
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 1.0,
      title: 'Product 4',
      size: 'XL',
    ),
    CartItemModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZQWihoOXt4U0Bi--pKEFf0gZrymLOJeymA&s',
      price: 1.0,
      title: 'Product 4',
      size: 'XL',
    ),
  ];
  void addItem(CartItemModel item) {
    final existingItemIndex =
        _items.indexWhere((element) => element.title == item.title);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].count += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItemModel item) {
    final existingItemIndex =
        _items.indexWhere((element) => element.title == item.title);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].count -= 1;
      if (_items[existingItemIndex].count == 0) {
        _items.removeAt(existingItemIndex);
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
    for (var item in products) {
      total += item.price * item.count;
    }
    return total;
  }
}
