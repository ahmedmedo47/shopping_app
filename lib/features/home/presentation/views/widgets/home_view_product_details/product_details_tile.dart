import 'package:flutter/material.dart';

class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      children: <Widget>[
        ListTile(
          title: Text(description),
        ),
      ],
    );
  }
}
