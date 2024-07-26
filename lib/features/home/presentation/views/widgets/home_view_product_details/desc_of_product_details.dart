import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/row_buttons_item.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/size_and_color_for_product_details.dart';

// Utility function to convert hex color code to Color object
Color hexToColor(String hex) {
  final buffer = StringBuffer();
  if (hex.length == 6 || hex.length == 7) buffer.write('ff');
  buffer.write(hex.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class DescOfProductDetails extends StatefulWidget {
  const DescOfProductDetails({super.key, required this.index, required this.product});
  final ProductModelAndHisVariants product;
  final int index;

  @override
  State<DescOfProductDetails> createState() => _DescOfProductDetailsState();
}

class _DescOfProductDetailsState extends State<DescOfProductDetails> {

  @override
  Widget build(BuildContext context) {
    String colorCode = widget.product.variants[widget.index].colorCode; // Replace with actual field
    Color color = hexToColor(colorCode);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.product.variants[widget.index].price} Є",
              style: const TextStyle(color: Color(0xff007D43), fontSize:24,fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8), // Adjust vertical spacing
            Text(
              widget.product.variants[widget.index].name,
              style: const TextStyle(color: Colors.black54, fontSize: 20,fontWeight:FontWeight.w500),
            ),
            const SizedBox(height: 16), // Adjust vertical spacing
            SizeAndColorForProductDetails(
              size: widget.product.variants[widget.index].size,
              color: color, // Pass the color if you modify SizeAndColorForProductDetails to accept color
            ),
            const SizedBox(height: 16), // Adjust vertical spacing
            ProductDetailsTile(
              title: 'description',
              description: widget.product.product.description,
            ),
            const SizedBox(height: 16), // Adjust vertical spacing
            Row(
              children: [
                const Text(
                  "brand : ",
                  style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w600),
                  // Example usage
                ),
                Text("${widget.product.product.brand}",style: const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500))
              ],
            ),
            const SizedBox(height: 20), // Adjust vertical spacing
            RowButtonsItem(product: widget.product,index: widget.index,),
          ],
        ),
      ),
    );
  }
}
