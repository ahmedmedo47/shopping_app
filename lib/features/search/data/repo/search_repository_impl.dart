import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/search/data/models/category_model.dart';
import 'package:shopping_app/features/search/data/models/product_model/product_model.dart';
import 'package:shopping_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  static const _productsUrl = 'https://api.printful.com/products';
  static const _categoriesUrl = 'https://api.printful.com/categories';

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_productsUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // log('Product response data: $data');

        List<ProductModel> products = (data['result'] as List<dynamic>)
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
        // log('Parsed products: $products');

        return Right(products);
      } else {
        log('Failed to load products with status code: ${response.statusCode}');
        return Left(ServerFailure(
            errorMessage: 'Failed to load products: ${response.reasonPhrase}'));
      }
    } catch (e) {
      log('Error loading products: $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_categoriesUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // log('Category response data: $data');

        List<CategoryModel> categories = (data['result']['categories']
                as List<dynamic>)
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
        // log('Parsed categories: $categories');

        return Right(categories);
      } else {
        log('Failed to load categories with status code: ${response.statusCode}');
        return Left(
          ServerFailure(
            errorMessage: 'Failed to load categories: ${response.reasonPhrase}',
          ),
        );
      }
    } catch (e) {
      log('Error loading categories: $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
