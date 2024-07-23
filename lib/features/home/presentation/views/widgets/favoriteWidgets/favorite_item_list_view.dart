import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/favoriteWidgets/favorite_item.dart';
class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:20,
        itemBuilder: (context,i){
      return const FavoriteItem();
    });
  }
}
