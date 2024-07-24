import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_widget.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color(0xffD6DAD8),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: HomeViewWidget(categoryName: "Clothes",),
      ),
    );
  }
}
