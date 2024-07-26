import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';

class FavoriteItem extends StatelessWidget {
  final ProductsModel product;

  const FavoriteItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final isFavorite = productsProvider.favoriteProducts.contains(product);

    return Container(
      height: MediaQuery.of(context).size.height * .26,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(product.image,
                width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "GTSectraFine",
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.currency}${product.variantCount ?? 0}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "4.8",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          productsProvider.removeFavorite(product);
                        } else {
                          productsProvider.addFavorite(product);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
