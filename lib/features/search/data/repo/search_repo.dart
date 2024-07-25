import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/search/data/models/category_model.dart';
import 'package:shopping_app/features/search/data/models/product_model/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
  Future<Either<Failure, List<ProductModel>>> fetchProducts();
}
