import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/categories_model.dart';

class HomeViewRowButton extends StatelessWidget {
  const HomeViewRowButton({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

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
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "homeViewCategoryDetails",
                  arguments: {"categoryName": category.title});
            },
            child: const Row(
              children: [
                Text(
                  "Shop Now",
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.black26,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
