import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/favoriteWidgets/favorite_item.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final favoriteProducts = productsProvider.favoriteProducts;
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return  FavoriteItem(product: favoriteProducts[i],);
        });
  }
}
