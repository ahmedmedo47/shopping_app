import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_details_for_list.dart';

class HomeViewList extends StatelessWidget {
  const HomeViewList({
    super.key,
    required this.categoriesList,
    required this.categorizedProducts,
  });

  final List<CategoriesModel> categoriesList;
  final Map<int, List<ProductsModel>> categorizedProducts;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final category = categoriesList[index];
          final products = categorizedProducts[category.id!] ?? [];
          return HomeViewDetailsForList(
            category: category,
            productsList: products,
          );
        },
        childCount: categoriesList.length,
      ),
    );
  }
}
