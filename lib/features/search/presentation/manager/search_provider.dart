import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/search/data/models/category_model.dart';
import 'package:shopping_app/features/search/data/models/product_model/product_model.dart';
import 'package:shopping_app/features/search/data/repo/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  final SearchRepo searchRepo;

  SearchProvider({required this.searchRepo}) {
    fetchProducts();
    fetchCategories();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<ProductModel> _searchResults = [];
  List<ProductModel> get searchResults => _searchResults;

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories =>
      _categories.where((category) => category.parentId == 0).toList();

  TextEditingController textController = TextEditingController();

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final Either<Failure, List<ProductModel>> result =
          await searchRepo.fetchProducts();
      result.fold(
        (failure) {
          _errorMessage = 'Failed to load products';
          print(_errorMessage);
          notifyListeners();
        },
        (products) {
          _products = products;
          notifyListeners();
        },
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      final Either<Failure, List<CategoryModel>> result =
          await searchRepo.fetchCategories();
      result.fold(
        (failure) {
          _errorMessage = 'Failed to load categories';
          print(_errorMessage);
          notifyListeners();
        },
        (categories) {
          _categories = categories;
          notifyListeners();
        },
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void performSearch() {
    String query = textController.text.toLowerCase();
    _isSearching = query.isNotEmpty;
    _searchResults = _products
        .where((product) => product.title!.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  void clearSearch() {
    textController.clear();
    _isSearching = false;
    _searchResults = [];
    notifyListeners();
  }
}
