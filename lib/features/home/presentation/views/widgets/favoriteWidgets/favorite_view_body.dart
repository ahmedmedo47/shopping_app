import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/favoriteWidgets/favorite_item_list_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white54,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Favorites",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          return FavoriteItemListView(items: favoritesProvider.favorites);
        },
      ),
    );
  }
}
