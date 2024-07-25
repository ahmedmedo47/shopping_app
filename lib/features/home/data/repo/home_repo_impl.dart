import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/home/data/models/products/products.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Products>>> fetchAllProducts() async {
    try {
      List<Products> productList = [];
      Map<String, dynamic> jsonData = await apiService.get(endPoints: "");
      List<dynamic> products = jsonData["items"];
      for (var i in products) {
        productList.add(Products.fromJson(i));
      }
      return right(productList);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
