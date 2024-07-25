import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/faliure.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';
import 'package:shopping_app/features/home/manager/fetch_all_categories/fetch_all_categories_state.dart';

class FetchAllCategoriesCubit extends Cubit<FetchAllCategoriesState> {
  final HomeRepo homeRepo;
  FetchAllCategoriesCubit(this.homeRepo) : super(FetchAllCategoriesInitial());

  Future<void> fetchAllCategories() async {
    emit(FetchAllCategoriesLoading());
    final Either<Failure, List<CategoriesModel>> data = await homeRepo.fetchAllCategories();

    data.fold(
          (failure) {
        emit(FetchAllCategoriesFailure(failure.toString()));
      },
          (categoriesList) {
        emit(FetchAllCategoriesSuccess(categoriesList: categoriesList));
      },
    );
  }

}
