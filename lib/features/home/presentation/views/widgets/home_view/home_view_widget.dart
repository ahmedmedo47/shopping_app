import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_list.dart';
class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeViewList()
      ],
    );
  }
}
