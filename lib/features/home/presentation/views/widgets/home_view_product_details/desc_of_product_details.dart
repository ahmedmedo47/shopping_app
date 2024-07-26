import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/row_buttons_item.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/size_and_color_for_product_details.dart';

class DescOfProductDetails extends StatefulWidget {
  const DescOfProductDetails({super.key, required this.price, required this.product});
  final String price;
  final ProductModelAndHisVariants product;

  @override
  State<DescOfProductDetails> createState() => _DescOfProductDetailsState();
}

class _DescOfProductDetailsState extends State<DescOfProductDetails> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.price,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              widget.product.variants[0].name,
              style: const TextStyle(color: Colors.black38, fontSize: 16),
            ),
            SizeAndColorForProductDetails(
              selectedSize: _selectedSize,
              onSizeChanged: (String? newSize) {
                setState(() {
                  _selectedSize = newSize;
                  print("Selected size: $_selectedSize"); // Debug print
                });
              },
            ),
            ProductDetailsTile(
              title: 'description',
              description: widget.product.product.description,
            ),
            Text(
              "brand :${widget.product.product.brand}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
             RowButtonsItem(),
          ],
        ),
      ),
    );
  }
}
