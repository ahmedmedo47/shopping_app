import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_list.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({
    super.key,
    required this.categoriesList,
    required this.productsList,
  });

  final List<CategoriesModel> categoriesList;
  final List<ProductsModel> productsList;

  List<CategoriesModel> _filterCategories(List<CategoriesModel> categories) {
    return categories.where((category) => category.parentId == 0).toList();
  }

  Map<int, List<ProductsModel>> _filterProductsByCategory(
      List<ProductsModel> products,
      List<CategoriesModel> categories,
      ) {
    final Map<int, List<ProductsModel>> categorizedProducts = {};

    for (var category in categories) {
      if (category.parentId == 0) {
        categorizedProducts[category.id!] = [];
      }
    }

    for (var product in products) {
      final List<int?> categoryIds = _getCategoryIds(product.mainCategoryId, categories);

      for (var categoryId in categoryIds) {
        if (categoryId != null && categorizedProducts.containsKey(categoryId)) {
          categorizedProducts[categoryId]!.add(product);
        }
      }
    }

    return categorizedProducts;
  }

  List<int?> _getCategoryIds(int? categoryId, List<CategoriesModel> categories) {
    final List<int?> categoryIds = [];
    final Map<int?, CategoriesModel> categoryMap = {
      for (var category in categories) category.id: category
    };

    CategoriesModel? category = categoryId != null ? categoryMap[categoryId] : null;
    while (category != null) {
      categoryIds.add(category.id);
      if (category.parentId == 0) break;
      category = categoryMap[category.parentId];
    }
    return categoryIds;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategoriesList = _filterCategories(categoriesList);
    final categorizedProducts = _filterProductsByCategory(productsList, categoriesList);

    return CustomScrollView(
      slivers: [
        HomeViewList(
          categoriesList: filteredCategoriesList,
          categorizedProducts: categorizedProducts,
        ),
      ],
    );
  }
}
