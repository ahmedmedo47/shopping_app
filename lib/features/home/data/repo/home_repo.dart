import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/home/data/models/products/products.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<Products>>> fetchAllProducts();
}