import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  final TextEditingController textController = TextEditingController();
  List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3'
  ]; // Example categories
  List<String> searchResults = [];
  bool isSearching = false;

  void performSearch() {
    // Simulate search logic
    isSearching = textController.text.isNotEmpty;
    searchResults = categories
        .where((category) =>
            category.toLowerCase().contains(textController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearch() {
    textController.clear();
    performSearch();
  }
}
