import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';

import '../../../../core/errors/faliure.dart';
import '../../data/models/product_model_and_his_variants/variant.dart';

part 'fetch_one_product_state.dart';

class FetchOneProductCubit extends Cubit<FetchOneProductState> {
  FetchOneProductCubit(this.homeRepo) : super(FetchOneProductInitial());
  final HomeRepo homeRepo;

  Future<void> fetchOneProducts({required int id}) async {
    emit(FetchOneProductsLoading());
    final Either<Failure, ProductModelAndHisVariants> data = await homeRepo.fetchOneProduct(id: id);

    data.fold(
          (failure) {
        print('Fetch failed: ${failure.errorMessage}');
        emit(FetchOneProductsFailure(failure.toString()));
      },
          (productModel) {
        print('Fetch successful');
        emit(FetchOneProductsSuccess(productsList:productModel ));
      },
    );
  }
}
