import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_container_details_for_list.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_row_button.dart';

class HomeViewDetailsForList extends StatelessWidget {
  const HomeViewDetailsForList({super.key, required this.categoriesList, required this.item, required this.productsList});
  final List<CategoriesModel> categoriesList;
  final List<ProductsModel> productsList;
  final int item;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeViewRowButton(
            categoriesList: categoriesList, item: item,
          ),
          SizedBox(
            height: height * 0.5,
            child: ListView.builder(
                itemCount: productsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, item) {
                  return HomeViewContainerDetailsForList(productsList: productsList, item: item,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
