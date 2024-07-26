
import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

class HomeViewRowButton extends StatelessWidget {
  const HomeViewRowButton({
    super.key,
    required this.category, required this.productList,
  });

  final CategoriesModel category;
  final List<ProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category.title,
            style: const TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "homeViewCategoryDetails",
                  arguments: {
                "categoryName": category.title,
                    "productsList": productList
              });
            },
            child: const Row(
              children: [
                Text(
                  "Shop Now",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.black54,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
