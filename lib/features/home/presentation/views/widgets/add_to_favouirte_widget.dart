import 'package:flutter/material.dart';
class AddToFavouirteWidget extends StatefulWidget {
  const AddToFavouirteWidget({Key? key}) : super(key: key);

  @override
  State<AddToFavouirteWidget> createState() => _AddToFavouirteWidgetState();
}

class _AddToFavouirteWidgetState extends State<AddToFavouirteWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffecf0ec),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
