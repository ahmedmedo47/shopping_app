import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/category_details.dart';

class CategoryDetailsGridView extends StatelessWidget {
  const CategoryDetailsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, i) {
        return const CategoryDetails();
      },
      shrinkWrap: true, // هذه الخاصية تجعل GridView يضبط حجمه بناءً على محتوياته
      physics: const NeverScrollableScrollPhysics(), // هذا يمنع GridView من التمرير نفسه
    );
  }
}
/*

 */