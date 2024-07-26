import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/presentation/manager/cart_provider.dart';
import 'package:shopping_app/features/home/data/models/product_model_and_his_variants/product_model_and_his_variants.dart';



class RowButtonsItem extends StatefulWidget {
  RowButtonsItem({super.key, required this.product, required this.index});

  @override
  State<RowButtonsItem> createState() => _ProductDetailsItemState();
  bool addedToTheCart = false;
  final ProductModelAndHisVariants product;
  final int index;

}

class _ProductDetailsItemState extends State<RowButtonsItem> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
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
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xffecf0ec),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: Icon(
              widget.addedToTheCart ? Icons.favorite : Icons.favorite_border,
              color: widget.addedToTheCart ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.addedToTheCart = !widget.addedToTheCart;
              });
            },
          ),
        )
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
