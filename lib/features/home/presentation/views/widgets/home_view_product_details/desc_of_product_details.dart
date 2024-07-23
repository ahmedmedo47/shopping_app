import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/row_buttons_item.dart';
class DescOfProductDetails extends StatefulWidget {
   const DescOfProductDetails({super.key, required this.price});
   final String price;

  @override
  State<DescOfProductDetails> createState() => _DescOfProductDetailsState();
}

class _DescOfProductDetailsState extends State<DescOfProductDetails> {
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
            const Text(
              "Details",
              style: TextStyle(color: Colors.black38, fontSize: 14),
            ),
            const ProductDetailsTile(
                title: 'title', description: 'description'),
            const ProductDetailsTile(
                title: 'title', description: 'description'),
            const ProductDetailsTile(
                title: 'title', description: 'description'),
            const SizedBox(height: 20),
            RowButtonsItem(),
          ],
        ),
      ),
    );
  }


}
