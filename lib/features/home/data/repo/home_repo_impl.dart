import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/variant.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoriesModel>>> fetchAllCategories() async {
    try {
      var data = await apiService.get(endPoint: "categories");
      List<CategoriesModel> categoriesList = [];
      if (data["result"]["categories"] != null) {
        for (var item in data["result"]["categories"]) {
          categoriesList.add(CategoriesModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(categoriesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> fetchAllProducts() async {
    try {
      var data = await apiService.get(endPoint: "products/");

      List<ProductsModel> productsList = [];
      if (data["result"] != null) {
        for (var item in data['result']) {
          productsList.add(ProductsModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override

  Future<Either<Failure, ProductModelAndHisVariants>> fetchOneProduct({required int id}) async {
    try {
      var data = await apiService.get(endPoint: "products/$id");
      if (data["result"] != null) {
        final productModel = ProductModelAndHisVariants.fromJson(data["result"]);
        return right(productModel);
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
