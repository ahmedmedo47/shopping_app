import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/home_view_body_category_details.dart';

class HomeViewCategoryDetails extends StatelessWidget {
  const HomeViewCategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String categoryName = data["categoryName"];
    return HomeViewBodyCategoryDetails(
      categoryName: categoryName,
    );
  }
}
