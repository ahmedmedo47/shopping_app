import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_list.dart';
class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        HomeViewList(categoryName: categoryName,)
      ],
    );
  }
}
