import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoriesModel>>> fetchAllCategories() async {
    try {
      var data = await apiService.get(endPoint: "categories");
      print(data);
      List<CategoriesModel> categoriesList = [];
      if (data["results"]["categories"] != null) {
        for (var item in data['items']["categories"]) {
          categoriesList.add(CategoriesModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(categoriesList);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> fetchAllProducts() async {
    try {
      var data = await apiService.get(endPoint: "products/");
      print(data);

      List<ProductsModel> productsList = [];
      if (data["results"]["categories"] != null) {
        for (var item in data['items']["categories"]) {
          productsList.add(ProductsModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModelAndHisVariants>>> fetchOneProduct({required int id}) async {
    try {
      var data = await apiService.get(endPoint: "products/$id");
      print(data);
      List<ProductModelAndHisVariants> productsList = [];
      if (data["results"]["categories"] != null) {
        for (var item in data['items']["categories"]) {
          productsList.add(ProductModelAndHisVariants.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

 
}
