import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/add_to_favouirte_widget.dart'; // Corrected import

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.product});
  final ProductsModel product;

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "homeViewProductDetailsScreen",
                  arguments: {"id": widget.product.id}, // Pass the product ID
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.product.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: AddToFavoriteWidget(
                      productsModel: widget.product,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Opacity(
            opacity: .4,
            child: Text(
              widget.product.description,
              maxLines: 2, // Limit number of lines
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
