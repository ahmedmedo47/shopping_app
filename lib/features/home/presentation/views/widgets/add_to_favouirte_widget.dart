import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';

class AddToFavoriteWidget extends StatelessWidget {
  const AddToFavoriteWidget({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.favorites.contains(productsModel);

        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffecf0ec),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              if (isFavorite) {
                favoritesProvider.removeFavorite(productsModel);
              } else {
                favoritesProvider.addFavorite(productsModel);
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
