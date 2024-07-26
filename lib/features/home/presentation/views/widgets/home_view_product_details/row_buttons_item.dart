import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/presentation/manager/cart_provider.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/add_to_favouirte_widget.dart';



class RowButtonsItem extends StatefulWidget {
  const RowButtonsItem({super.key, required this.product, required this.index});

  @override
  State<RowButtonsItem> createState() => _ProductDetailsItemState();
  final ProductModelAndHisVariants product;
  final int index;

}

class _ProductDetailsItemState extends State<RowButtonsItem> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              _messageAlret("", "Added To the cart successfully!");
              cartProvider.addItem(widget.product.variants[widget.index]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const Center(
                  child: Text(
                "+ Add To Cart",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    );
  }

  void _messageAlret(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontSize: 30)),
          content: Text(text, style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
