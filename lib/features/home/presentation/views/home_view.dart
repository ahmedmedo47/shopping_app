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
  late Future<void> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    await context.read<FetchAllCategoriesCubit>().fetchAllCategories();
    await context.read<FetchAllProductsCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6DAD8),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: FutureBuilder<void>(
          future: _fetchDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return BlocBuilder<FetchAllCategoriesCubit, FetchAllCategoriesState>(
                builder: (context, categoryState) {
                  return BlocBuilder<FetchAllProductsCubit, FetchAllProductsState>(
                    builder: (context, productState) {
                      if (categoryState is FetchAllCategoriesSuccess && productState is FetchAllProductsSuccess) {
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
              );
            }
          },
        ),
      ),
    );
  }
}
