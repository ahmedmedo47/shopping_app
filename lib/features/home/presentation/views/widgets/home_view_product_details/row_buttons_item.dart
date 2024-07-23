import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
class RowButtonsItem extends StatefulWidget {
   RowButtonsItem({super.key});

  @override
  State<RowButtonsItem> createState() => _ProductDetailsItemState();
  bool addedToTheCart = false;
}

class _ProductDetailsItemState extends State<RowButtonsItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              _messageAlret("title", "text");
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius:
                BorderRadius.all(Radius.circular(12)),
              ),
              child: const Center(
                  child: Text(
                    "+ Add To Cart",
                    style: TextStyle(
                        fontSize: 20, color: Colors.white),
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
              widget.addedToTheCart
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
              widget.addedToTheCart ? Colors.red : Colors.black,
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
