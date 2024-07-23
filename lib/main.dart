import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/presentation/views/cart_view.dart';
import 'package:shopping_app/features/home/presentation/views/home_view.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_product_details_Screen.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_category_details.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';
import 'package:shopping_app/features/search/presentation/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        routes: {
          "cartView": (context) => const CartView(),
          "/homeView":(context)=>const HomeViewCategoryDetails(),
          "HomeViewProductDetailsScreen": (context) => const HomeViewProductDetailsScreen(),
          "searchView": (context) => const SearchView(),
        },
        home: const HomeView(),
      ),
    );
  }
}
