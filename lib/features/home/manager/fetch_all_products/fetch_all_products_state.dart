
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

abstract class FetchAllProductsState {}

class FetchAllProductsInitial extends FetchAllProductsState {}

class FetchAllProductsLoading extends FetchAllProductsState {}

class FetchAllProductsSuccess extends FetchAllProductsState {
  final List<ProductsModel> productsList;
  FetchAllProductsSuccess({required this.productsList});
}

class FetchAllProductsFailure extends FetchAllProductsState {
  final String errorMessage;
  FetchAllProductsFailure(this.errorMessage);
}
