import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductsModel>>> fetchAllProducts();
  Future<Either<Failure, List<CategoriesModel>>> fetchAllCategories();
  Future<Either<Failure, List<ProductModelAndHisVariants>>> fetchOneProduct({required int id});

}
