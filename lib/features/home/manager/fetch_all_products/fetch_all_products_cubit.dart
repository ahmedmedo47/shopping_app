import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';
import 'package:shopping_app/features/home/manager/fetch_all_products/fetch_all_products_state.dart';

class FetchAllProductsCubit extends Cubit<FetchAllProductsState> {
  final HomeRepo homeRepo;
  FetchAllProductsCubit(this.homeRepo) : super(FetchAllProductsInitial());

  Future<void> fetchAllProducts() async {
    emit(FetchAllProductsLoading());
    final Either<Failure, List<ProductsModel>> data = await homeRepo.fetchAllProducts();

    data.fold(
          (failure) {
        emit(FetchAllProductsFailure(failure.toString()));
      },
          (productsList) {
        emit(FetchAllProductsSuccess(productsList: productsList));
      },
    );
  }

}
