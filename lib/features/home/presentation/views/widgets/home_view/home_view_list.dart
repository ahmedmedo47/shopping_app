import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_details_for_list.dart';

class HomeViewList extends StatelessWidget {
  HomeViewList({super.key, required this.categoriesList, required this.productsList});
  final List<CategoriesModel> categoriesList;
  final List<ProductsModel> productsList;

   Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HomeViewDetailsForList(
            categoriesList: categoriesList, item: index, productsList: productsList,
          );
        },
        childCount: categoriesList.length,
      ),
    );
  }
}
