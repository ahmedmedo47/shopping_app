import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/cart/presentation/views/cart_view.dart';
import 'package:shopping_app/features/home/data/repo/home_repo.dart';
import 'package:shopping_app/features/home/data/repo/home_repo_impl.dart';
import 'package:shopping_app/features/home/manager/fetch_all_categories/fetch_all_categories_cubit.dart';
import 'package:shopping_app/features/home/manager/fetch_all_products/fetch_all_products_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/home_view.dart';
import 'package:shopping_app/features/cart/presentation/manager/cart_provider.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_category_details.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_product_details_Screen.dart';
import 'package:shopping_app/features/navigation_bar/presentaions/views/navigation_bar.dart';
import 'package:shopping_app/features/search/data/repo/search_repository_impl.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepo>(
          create: (context) => HomeRepoImpl(apiService: ApiService(dio: Dio())),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FetchAllProductsCubit>(
            create: (context) => FetchAllProductsCubit(
              RepositoryProvider.of<HomeRepo>(context),
            ),
          ),
          BlocProvider<FetchAllCategoriesCubit>(
            create: (context) => FetchAllCategoriesCubit(
              RepositoryProvider.of<HomeRepo>(context),
            ),
          ),
          ChangeNotifierProvider(create: (_) => SearchProvider(searchRepo: SearchRepoImpl())),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      routes: {
        "homeViewCategoryDetails": (context) => const HomeViewCategoryDetails(),
        "homeViewProductDetailsScreen": (context) => const HomeViewProductDetailsScreen(),
        "cartView": (context) => const CartView(),
      },
      home: NavigationBarForApp(),
    );
  }
}
