import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_list.dart';
class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key, required this.categoriesList, required this.productsList});
  final List<CategoriesModel> categoriesList;
  final List<ProductsModel> productsList;

  // Filters categories to only include top-level categories (parentId == 0)
  List<CategoriesModel> _filterCategories(List<CategoriesModel> categories) {
    return categories.where((category) => category.parentId == 0).toList();
  }

  // Filters products and assigns them to their top-level categories
  List<ProductsModel> _filterProductsByCategories(
      List<ProductsModel> products,
      List<CategoriesModel> categories) {
    final categoryMap = _buildCategoryMap(categories);
    final categoryProductsMap = <int , List<ProductsModel>>{};

    for (var product in products) {
      // Ensure mainCategoryId is non-null
      final categoryId = product.mainCategoryId;
      if (categoryId != null && categoryMap.containsKey(categoryId)) {
        final topLevelCategory = _findTopLevelCategory(categoryMap[categoryId]!, categoryMap);
        final topLevelCategoryId = topLevelCategory.id!;

        if (!categoryProductsMap.containsKey(topLevelCategoryId)) {
          categoryProductsMap[topLevelCategoryId] = [];
        }

        categoryProductsMap[topLevelCategoryId]!.add(product);
      }
    }

    // Flatten the map into a list of products
    return categoryProductsMap.values.expand((products) => products).toList();
  }

  // Creates a map of category IDs to categories
  Map<int, CategoriesModel> _buildCategoryMap(List<CategoriesModel> categories) {
    // Handle nullable IDs by filtering out nulls
    return {
      for (var category in categories)
        if (category.id != null) category.id!: category
    };
  }

  // Finds the top-level category by traversing parent categories
  CategoriesModel _findTopLevelCategory(CategoriesModel category, Map<int, CategoriesModel> categoryMap) {
    while (category.parentId != 0 && categoryMap.containsKey(category.parentId!)) {
      category = categoryMap[category.parentId!]!;
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategoriesList = _filterCategories(categoriesList);
    final filteredProductsList = _filterProductsByCategories(productsList, categoriesList);

    return CustomScrollView(
      slivers: [
        HomeViewList(
          categoriesList: filteredCategoriesList,
          productsList: filteredProductsList,
        )
      ],
    );
  }
}


