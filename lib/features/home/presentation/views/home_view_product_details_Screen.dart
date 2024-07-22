import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/home_view_product_details_widget.dart';
class HomeViewProductDetailsScreen extends StatelessWidget {
  const HomeViewProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewProductDetailsWidget(),
    );
  }
}
