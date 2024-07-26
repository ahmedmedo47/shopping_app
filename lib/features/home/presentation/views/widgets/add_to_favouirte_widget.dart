import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/variant.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
class AddToFavouirteWidget extends StatefulWidget {
  const AddToFavouirteWidget({Key? key, required this.productsModel}) : super(key: key);
  final ProductsModel productsModel;

  @override
  State<AddToFavouirteWidget> createState() => _AddToFavouirteWidgetState();
}

class _AddToFavouirteWidgetState extends State<AddToFavouirteWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffecf0ec),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
          favoritesProvider.addFavorite(widget.productsModel);
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
