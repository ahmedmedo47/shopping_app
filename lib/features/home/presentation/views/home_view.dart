import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/manager/fetch_all_categories/fetch_all_categories_cubit.dart';
import 'package:shopping_app/features/home/manager/fetch_all_categories/fetch_all_categories_state.dart';
import 'package:shopping_app/features/home/manager/fetch_all_products/fetch_all_products_cubit.dart';
import 'package:shopping_app/features/home/manager/fetch_all_products/fetch_all_products_state.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Fetch categories and products when the widget is first built
    context.read<FetchAllCategoriesCubit>().fetchAllCategories();
    context.read<FetchAllProductsCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6DAD8),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: BlocBuilder<FetchAllCategoriesCubit, FetchAllCategoriesState>(
          builder: (context, categoryState) {
            print("Category state: $categoryState");
            return BlocBuilder<FetchAllProductsCubit, FetchAllProductsState>(
              builder: (context, productState) {
                print("Product state: $productState");
                if (categoryState is FetchAllCategoriesLoading || productState is FetchAllProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (categoryState is FetchAllCategoriesSuccess && productState is FetchAllProductsSuccess) {
                  return HomeViewWidget(
                    categoriesList: categoryState.categoriesList,
                    productsList: productState.productsList,
                  );
                } else if (categoryState is FetchAllCategoriesFailure) {
                  return Center(child: Text(categoryState.errorMessage));
                } else if (productState is FetchAllProductsFailure) {
                  return Center(child: Text(productState.errorMessage));
                } else {
                  return const Center(child: Text('Unexpected state'));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
