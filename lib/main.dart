import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_product_details_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeViewProductDetailsScreen(),
    );
  }
}
