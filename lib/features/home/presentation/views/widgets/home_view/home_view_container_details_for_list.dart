import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/products_model/products_model.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/add_to_favouirte_widget.dart';

import 'package:shopping_app/features/home/manager/product_provider.dart';

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
              arguments: {"id": product.id}, 
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
                        style: const TextStyle(fontSize: 16, color: Color(0xFF6C6C6C)),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: height * .15,
                right: 2,
                child:  AddToFavoriteWidget(productsModel: product,),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
