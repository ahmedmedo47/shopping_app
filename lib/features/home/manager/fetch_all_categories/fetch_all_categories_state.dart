import 'package:shopping_app/features/home/data/models/categories_model.dart';

abstract class FetchAllCategoriesState {}

class FetchAllCategoriesInitial extends FetchAllCategoriesState {}

class FetchAllCategoriesLoading extends FetchAllCategoriesState {}

class FetchAllCategoriesSuccess extends FetchAllCategoriesState {
  final List<CategoriesModel> categoriesList;
  FetchAllCategoriesSuccess({required this.categoriesList});
}

class FetchAllCategoriesFailure extends FetchAllCategoriesState {
  final String errorMessage;
  FetchAllCategoriesFailure(this.errorMessage);
}
