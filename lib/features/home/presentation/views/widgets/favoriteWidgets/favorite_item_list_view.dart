import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/variant.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/favoriteWidgets/favorite_item.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key, required this.items});

  final List<Variant> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return FavoriteItem(item: items[i]);
      },
    );
  }
}
