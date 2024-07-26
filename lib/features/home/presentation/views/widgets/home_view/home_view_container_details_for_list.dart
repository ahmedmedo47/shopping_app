import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';

class HomeViewContainerDetailsForList extends StatelessWidget {
  const HomeViewContainerDetailsForList({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              "homeViewProductDetailsScreen",
              arguments: {"id": product.id}, // Pass the product ID
            );
          },
          child: Stack(
            children: [
              Container(
                width: width * 0.6,
                height: height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(product.image), fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        product.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: height * .15,
                right: 2,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffecf0ec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Handle adding to cart or favorites
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
