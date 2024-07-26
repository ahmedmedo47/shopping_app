import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/home_view_product_details_widget.dart';

class HomeViewProductDetailsScreen extends StatelessWidget {
  const HomeViewProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int id = data["id"];
    return const Scaffold(
      body:  HomeViewProductDetailsWidget(
        price: "id",
      ),
    );
  }
}
