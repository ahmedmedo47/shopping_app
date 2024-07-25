import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/button_action.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/category_details_grid_view.dart';
import 'package:shopping_app/features/search/data/models/product_model/product_model.dart';

class HomeViewBodyCategoryDetails extends StatelessWidget {
   const HomeViewBodyCategoryDetails({super.key, required this.categoryName, required this.productList});
  final String categoryName;
  final List<ProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(categoryName),
        ),
      ),
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children:  [
          const SizedBox(height: 12),
          const ButtonAction(), // تأكد من تعريف هذا الودجت بشكل صحيح
          const SizedBox(height: 20),
          CategoryDetailsGridView(productList: productList,), // تأكد من تعريف هذا الودجت بشكل صحيح
        ],
      ),
    );
  }
}
