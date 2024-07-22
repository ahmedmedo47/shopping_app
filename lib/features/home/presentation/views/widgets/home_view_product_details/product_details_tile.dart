import 'package:flutter/material.dart';
class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile({Key? key, required this.title, required this.description}) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("$title",style: TextStyle(fontSize: 20),),
      children: <Widget>[
        ListTile(
          title: Text("$description"),
        ),
      ],
    );
  }
}
