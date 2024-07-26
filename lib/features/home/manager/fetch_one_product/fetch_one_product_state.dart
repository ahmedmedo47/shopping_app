part of 'fetch_one_product_cubit.dart';

@immutable
abstract class FetchOneProductState {}

class FetchOneProductInitial extends FetchOneProductState {}
class FetchOneProductsLoading extends FetchOneProductState{}

class FetchOneProductsSuccess extends FetchOneProductState {
  final ProductModelAndHisVariants productsList;
  FetchOneProductsSuccess({required this.productsList});
}

class FetchOneProductsFailure extends FetchOneProductState {
  final String errorMessage;
  FetchOneProductsFailure(this.errorMessage);
}
