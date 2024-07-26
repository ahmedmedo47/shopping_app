import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';

part 'fetch_one_product_state.dart';

class FetchOneProductCubit extends Cubit<FetchOneProductState> {
  final HomeRepo homeRepo;
  final Map<int, ProductModelAndHisVariants> _cachedProducts = {};

  FetchOneProductCubit(this.homeRepo) : super(FetchOneProductInitial());

  Future<void> fetchOneProducts({required int id}) async {
    if (_cachedProducts.containsKey(id)) {
      emit(FetchOneProductsSuccess(productsList: _cachedProducts[id]!));
      return;
    }

    emit(FetchOneProductsLoading());
    final Either<Failure, ProductModelAndHisVariants> data = await homeRepo.fetchOneProduct(id: id);

    data.fold(
          (failure) {
        print('Fetch failed: ${failure.toString()}');
        emit(FetchOneProductsFailure(failure.toString()));
      },
          (productModel) {
        print('Fetch successful');
        _cachedProducts[id] = productModel;
        emit(FetchOneProductsSuccess(productsList: productModel));
      },
    );
  }
}
